#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mintbind.h>

void gmint_free(void * p);
void * gmint_malloc(size_t n);
size_t gmint_getsize(void * p);
void *gmint_realloc(void *ptr,size_t size);

void gmint_free(void * p) {
    size_t * in = (size_t *)p;
    if (in) {
        --in; Mfree(in);
    }
}

void * gmint_malloc(size_t n) {
    size_t * result = (size_t *)Mxalloc(n + sizeof(size_t), 3);
    if (result) { *result = n; ++result; memset(result,0,n); }
    return result;
}

size_t gmint_getsize(void * p) {
    size_t * in = (size_t *)p;
    if (in) { --in; return *in; }
    return -1;
}

void *gmint_realloc(void *ptr,size_t size) {
    void *newptr;
    int msize;
    msize = gmint_getsize(ptr);
    // printf("msize=%d\n", msize);
    if (size <= msize)
        return ptr;
    newptr = gmint_malloc(size);
    memcpy(newptr, ptr, msize);
    gmint_free(ptr);
    return newptr;
}