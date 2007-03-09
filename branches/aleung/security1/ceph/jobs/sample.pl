#!/usr/bin/perl
# hi there
{
# startup
    'n' => 30,         # number of mpi nodes
    'sleep' => 3,      # seconds to sleep between runs (so you have time to control-c out)
    'nummds' => 1,   
    'numosd' => 6,
    'numclient' => 100,
    
    'until' => 100,     # --syn until $n  ... synthetic client will stop itself after this many seconds.
    'kill_after' => 300, # seconds before everything commits suicide (in case something hangs)
    
    # stuff i want to vary
    # here's a simple example:
    
    # do --syn writefile command
    'writefile' => 1,    
    # and very the write size
    'writefile_size' => [ # vary 
			  #2048*1024,
			  1024*1024,
			  512*1024,
			  256*1024,
			  128*1024,
			  64*1024,
			  48*1024,
			  32*1024,
			  28*1024,
			  24*1024,
			  16*1024,
			  12*1024,
			  8*1024,
			  4096,
			  #256,
			  #16,
			  #1
			  ],
    	'writefile_mb' => 1000,    # each client shoudl write 1GB (or more likely, keep going until time runs out)
    	
    	'file_layout_num_rep'=> [1,2],  # also vary the replication level
    
    	# pass some other random things to newsyn
    	'custom' => '--',
	
    	# for final summation (script/sum.pl)
    	# specify time period to look at the results
    	'start' => 30,    # skip first 30 seconds, so that caches are full etc.
    	'end' => 90,      # go for 60 seconds 
    
    	# what should i parse/plot?
    	'comb' => {
	    'x' => 'writefile_size',
	    'vars' => [ 'osd.c_wrb', 'osd.r_wrb' ], 
 	}
};
