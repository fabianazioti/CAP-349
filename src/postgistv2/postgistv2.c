/*
  Copyright (C) 2017 National Institute For Space Research (INPE) - Brazil.


 */

/*!
 *
 * \file postgistv2/postgistv2.c
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


/* PostgreSQL */
#include <postgres.h>
#include <fmgr.h>


/* Prototype definitions */
void _PG_init(void);

void _PG_fini(void);


/*
  Note: assure that this is the only PG_MODULE_MAGIC definition
  in the whole extension!
 */
PG_MODULE_MAGIC;


void _PG_init()
{
  /*elog(NOTICE, "postgist initialized!");*/
}


void _PG_fini()
{
  /*elog(NOTICE, "GeoExtension finalized!");*/
}
