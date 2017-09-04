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


PG_FUNCTION_INFO_V1(trajectory_elem_in);

Datum
trajectory_elem_in(PG_FUNCTION_ARGS)
{
  char *input = PG_GETARG_CSTRING(0);

  struct trajectory_elem *trje = (struct trajectory_elem *) palloc(sizeof(struct trajectory_elem));

  trje->geom_elem = DatumGetPointer(DirectFunctionCall1(LWGEOM_in, input));
}

PG_FUNCTION_INFO_V1(trajectory_elem);

Datum
trajectory_elem(PG_FUNCTION_ARGS)
{

  GSERIALIZED *geom = (GSERIALIZED*)PG_DETOAST_DATUM(PG_GETARG_DATUM(0));

  /*transforma para poder manipular*/
  // LWGEOM *lwgeom = lwgeom_from_gserialized(geom);

  struct trajectory_elem *trje = (struct trajectory_elem *) palloc(sizeof(struct trajectory_elem));

  trje->geom_elem = lwgeom_from_gserialized(geom);

  if ( lwgeom_is_empty(trje->geom_elem))
  {
    PG_FREE_IF_COPY(geom, 0);
    PG_RETURN_NULL();
  }


  PG_FREE_IF_COPY(geom, 0);

  elog(NOTICE, "trajectory_elem Finished");

  // PG_RETURN_TRAJECTELEM_TYPE_P(trje);

  PG_RETURN_CSTRING(hexwkb);

}
