/*  Boolector: Satisfiablity Modulo Theories (SMT) solver.
 *
 *  Copyright (C) 2007-2009 Robert Daniel Brummayer.
 *  Copyright (C) 2007-2013 Armin Biere.
 *  Copyright (C) 2012-2013 Aina Niemetz, Mathias Preiner.
 *
 *  All rights reserved.
 *
 *  This file is part of Boolector.
 *  See COPYING for more information on using this software.
 */

#ifndef BTORDUMPSMT_H_INCLUDED
#define BTORDUMPSMT_H_INCLUDED

#include "btorcore.h"
#include <stdio.h>

void btor_dump_smt1_nodes (Btor * btor, FILE * file, BtorNode ** roots,
                           int nroots);

void btor_dump_smt1 (Btor * btor, FILE * file);

void btor_dump_smt2_nodes (Btor * btor, FILE * file, BtorNode ** roots,
                           int nroots); 

void btor_dump_smt2 (Btor * btor, FILE * file);

#endif
