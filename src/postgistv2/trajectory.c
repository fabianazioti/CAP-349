#include "trajectory.h"


/* PostgreSQL */
#include <libpq/pqformat.h>
#include <fmgr.h>
#include <utils/builtins.h>
#include <utils/timestamp.h>
#include <utils/array.h> /*suporte para o tipo array*/
#include <measures.h> /*para a funcao de teste*/
#include <funcapi.h>
#include <catalog/pg_type.h> /*tipo na construcao do array*/
#include <utils/lsyscache.h> /*construcao do array com o tipo*/



PG_FUNCTION_INFO_V1(trajectory_elem);

Datum
trajectory_elem(PG_FUNCTION_ARGS)
{

  GSERIALIZED *geom = (GSERIALIZED*)PG_DETOAST_DATUM(PG_GETARG_DATUM(0));

  /*transforma para poder manipular*/
  LWGEOM *lwgeom = lwgeom_from_gserialized(geom);

  elog(NOTICE, "sizeof(LWGEOM*) %d", sizeof(LWGEOM*));
  elog(NOTICE, "lwgeom %d", sizeof(lwgeom));


  if ( lwgeom_is_empty(lwgeom))
  {
    PG_FREE_IF_COPY(geom, 0);
    PG_RETURN_NULL();
  }


  char *hexwkb;
  size_t hexwkb_size;

  hexwkb = lwgeom_to_hexwkb(lwgeom, WKB_EXTENDED, &hexwkb_size);

  elog(NOTICE, "sizeof %d ", strlen(hexwkb));
  elog(NOTICE, "sizeof %d ", hexwkb_size);
  elog(NOTICE, "%s", hexwkb);


  lwgeom_free(lwgeom);
  PG_FREE_IF_COPY(geom, 0);

  elog(NOTICE, "trajectory_elem Finished");

  // PG_RETURN_TRAJECTELEM_TYPE_P(trje);

  PG_RETURN_CSTRING(hexwkb);

}
