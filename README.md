# ARM big.LITTLE
Presentation on benchmarking ARM big.LITTLE cores using the Odroid-XU3/-XU4. Performed for my Operating Systems course, Spring 2020.

# Summary of test
An odroid XU4 was benchmarked with 7zip running compression and decompression tests on a 22MB dict. The following configurations were tested:
  * 1 core, 1 thread big
  * 4 cores, 4 threads big
  * 1 core, 1 thread LITTLE
  * 4 cores, 4 threads LITTLE
  * All cores, 8 threads
  
# Summary of findings
Both big and LITTLE core compression performance is hampered by cache size. LITTLE core decompression (almost pure integer math workload) exceeds the 50% (of big) performance expectation. Big core decompression is somewhat affected by throttling. All cores compression and decompression struggles with throttling. All core performance also appears to be constrained by an unknown bottle neck, causing large variations in run-to-run performance. Potential sources of bottle neck are cache size, and unomptimal scheduling with respect to which set of cores are loaded.
