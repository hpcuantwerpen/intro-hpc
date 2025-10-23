#include <mpi.h>
#include <iostream>
#include <cmath>  // For sqrt()

using namespace std;

// Function to check primality 
bool is_prime(int x) {
    if (x < 2) return false;
    int flag = 0;
    int limit = sqrt(x);

    for (int div = 2; div <= limit; div++) {
        if (flag == 1) continue;  // Early exit condition
        if (x % div == 0) {
            flag = 1; // Mark as not prime
        }
    }
    
    return flag == 0;
}

int main(int argc, char** argv) {
    int rank, size, n = 100000000;
    
    // Initialize MPI
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    // Determine the range of numbers for this MPI process
    int chunk_size = n / size;
    int start = 2 + rank * chunk_size;
    int end = (rank == size - 1) ? n : start + chunk_size;

    // Start timer
    double start_time = MPI_Wtime();

    // Check numbers in the assigned range
    for (int x = start; x < end; x++) {
        if (is_prime(x)) {
            cout << "Process " << rank << ": " << x << " is prime" << endl;
        }
    }

    // Synchronize all processes
    MPI_Barrier(MPI_COMM_WORLD);

    // Stop timer
    double end_time = MPI_Wtime();
    if (rank == 0) {
        cout << "Execution time: " << (end_time - start_time) << " seconds" << endl;
    }

    // Finalize MPI
    MPI_Finalize();
    return 0;
}
