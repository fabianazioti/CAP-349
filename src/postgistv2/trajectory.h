/*!
 *
 * \file postgistv2/trajectory.h
 *
 * \brief
 *
 * \author Gilberto Ribeiro de Queiroz
 * \author Fabiana Zioti
 *
 * \date 2017
 *
 * \copyright GNU Lesser Public License version 3
 *
 */

#ifndef __POSTGIST_TRAJECTORY_H__
#define __POSTGIST_TRAJECTORY_H__

/* PostgreSQL */
#include <postgres.h>
#include <liblwgeom.h>
#include<lwgeom_pg.h>
#include <utils/datetime.h>


struct trajectory_elem
{
  // int32 dummy;    /* Padding to make it double aligned. */
  // Timestamp time_obj;
  LWGEOM *geom_elem;       /* Geometry Object */
};

struct trajectory
{
  Timestamp start_time;
  Timestamp end_time;
  LWGEOM *hull;
  struct trajectory_elem data[FLEXIBLE_ARRAY_MEMBER];
};

#define DatumGetTrajectoryElem(X)      ((struct trajectory_elem*) PG_DETOAST_DATUM(X))
#define PG_GETARG_TRAJECTELEM_TYPE_P(n)  DatumGetTrajectoryElem(PG_GETARG_DATUM(n))
#define PG_RETURN_TRAJECTELEM_TYPE_P(x)  PG_RETURN_POINTER(x)

// #define DatumGetTrajectory(X)      ((struct trajectory *) PG_DETOAST_DATUM(X))
// #define PG_GETARG_TRAJECTORY_TYPE_P(n)  DatumGetTrajectory(PG_GETARG_DATUM(n))
// #define PG_RETURN_TRAJECTORY_TYPE_P(x)  PG_RETURN_POINTER(x)

extern Datum trajectory_elem_in(PG_FUNCTION_ARGS);

// extern Datum LWGEOM_in(PG_FUNCTION_ARGS);

extern Datum trajectory_elem(PG_FUNCTION_ARGS);
extern Datum trajectory_elem_out(PG_FUNCTION_ARGS);
extern Datum trajectory_elem_to_str(PG_FUNCTION_ARGS);
extern Datum trajectory_elem_from_text(PG_FUNCTION_ARGS);



#endif  /* __POSTGIST_H__ */
