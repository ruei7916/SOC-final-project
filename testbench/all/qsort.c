#include "qsort.h"
<<<<<<< HEAD
int __attribute__ ( ( section ( ".mprjram" ) ) ) partition(int low,int hi){
=======
#define reg_fir_start (*(volatile unsigned int*)0x380002ac)

int __attribute__ ( ( section ( ".mprjram.3" ) ) ) partition(int low,int hi){
>>>>>>> 0c3d45d0f02d4144b80500b6bf78d34e0abf1162
	int pivot = Q[hi];
	int i = low-1,j;
	int temp;
	for(j = low;j<hi;j++){
		if(Q[j] < pivot){
			i = i+1;
			temp = Q[i];
			Q[i] = Q[j];
			Q[j] = temp;
		}
	}
	if(Q[hi] < Q[i+1]){
		temp = Q[i+1];
		Q[i+1] = Q[hi];
		Q[hi] = temp;
	}
	return i+1;
}

void __attribute__ ( ( section ( ".mprjram.2" ) ) ) sort(int low, int hi){
	if(low < hi){
		int p = partition(low, hi);
		sort(low,p-1);
		sort(p+1,hi);
	}
}

void __attribute__ ( ( section ( ".mprjram.1" ) ) ) start_workload(){
	// start DMA and fir_mm
	reg_fir_start = 1;
	sort(0,size-1);
	//return Q;
}
