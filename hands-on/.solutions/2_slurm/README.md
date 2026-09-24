Given the incomplete job script matrix.slurm, which compiles and runs matrix_multiply.c

make these changes to the job script
   - add the project account to the jobscript – use ap_course_hpc_intro
   - request 1 task with 10 cores 
   - change the output and error formats to be <job_name>.<job-id>.out
     remember: replace <job_name> and <job-id> by the proper filename pattern
   - send yourself an email when the job is finished
   - add a 300 second sleep at the end of the script – so it stays in the queue for a while longer

submit the jobscript
   - while the job is running, try several of the Slurm commands – squeue, sstat, sacct
   - what information is stored in the accounting database? – sacct

