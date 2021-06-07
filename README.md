# Genome Assembly App

After the DNA is sequenced, result is a lot of smaller reads.  
These reads need to be put together, so that the original sequence can be obtained.  
Since there is no reference genome, this is De novo genome assembly, meaning from scratch.  
There are four ways to do this and algorithms are implemented in backend.  

<img src= /appGifs/DnaGenomeAssembly.gif width="800" height="450" />

## Shortest common superstring (SCS)

This way can give good approximation. The idea is to find the shorstest superstring that contains all given reads.
Bad side od this idea is that complexity rapidly grows as there are more input reads.  
This is because this algorithm checks all possible schedules and that grows really fast (n!). 

## Greedy Shortest common superstring (GSCS)

This algorithm is faster, but the bad side is that it cannot promise optimal solution.

## OLC (Overlap-Layout-Consensus)

## DeBrujin Graphs

## Status
Everything will be soon updated.
