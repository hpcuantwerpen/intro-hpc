#include <omp.h>
#include <iostream>
#include <cmath>  // For sqrt()

using namespace std;

// Function to check primality using OpenMP
bool is_prime(int x) {
    if (x < 2) return false;
    int flag = 0;

    int limit = sqrt(x);
    #pragma omp parallel for shared(flag)
    for (int div = 2; div <= limit; div++) {
        if (flag == 1) continue;  // Early exit condition
        if (x % div == 0) {
            #pragma omp critical
            flag = 1; // Mark as not prime
        }
    }

    return flag == 0;
}

int main() {
    int n = 100000000;

    // Start timer
    double start_time = omp_get_wtime();

    // Check numbers in the range
    for (int x = 2; x < n; x++) {
        if (is_prime(x)) {
            cout << x << " is prime" << endl;
        }
    }

    // Stop timer
    double end_time = omp_get_wtime();
    cout << "Execution time: " << (end_time - start_time) << " seconds" << endl;

    return 0;
}
