#include <stdio.h>
#include "random.h"
#include "time.h"

ranctx rrgenerator;

u4 ranval( ranctx *x ) 
{
    u4 e = x->a - randrot(x->b, 27);
    x->a = x->b ^ randrot(x->c, 17);
    x->b = x->c + x->d;
    x->c = x->d + e;
    x->d = e + x->a;
    return x->d;
}

void raninit( ranctx *x, u4 seed ) 
{
    u4 i;
    x->a = 0xf1ea5eed, x->b = x->c = x->d = seed;
    for (i=0; i<20; ++i) {
        (void)ranval(x);
    }
}

void burtle_srand(u4 seed)
{
   raninit(&rrgenerator, seed);
}

double burtle_random()
{
   if ( rrgenerator.initialized == 0 )
      srand(clock());

   return 1.0 * ranval(&rrgenerator) / 0xffffffff; 
}

/*
int main(int argc, char* argv[])
{
   srand(100);
   for(int i=0; i<100; i++)
   {
      float r = random();
      printf(" %f\n", r);
   }
}
*/

