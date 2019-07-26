/*  Boolector: Satisfiablity Modulo Theories (SMT) solver.
 *
 *  Copyright (C) 2014 Aina Niemetz.
 *  Copyright (C) 2014 Mathias Preiner.
 *
 *  All rights reserved.
 *
 *  This file is part of Boolector.
 *  See COPYING for more information on using this software.
 */

#ifndef BTOROPTS_H_INCLUDED
#define BTOROPTS_H_INCLUDED

#define BTOR_INPUT_FORMAT_BTOR -1
#define BTOR_INPUT_FORMAT_SMT1 1
#define BTOR_INPUT_FORMAT_SMT2 2

#define BTOR_OUTPUT_BASE_BIN 0
#define BTOR_OUTPUT_BASE_HEX 1
#define BTOR_OUTPUT_BASE_DEC 2

#define BTOR_OUTPUT_FORMAT_BTOR2 -2
#define BTOR_OUTPUT_FORMAT_BTOR -1
#define BTOR_OUTPUT_FORMAT_SMT1 1
#define BTOR_OUTPUT_FORMAT_SMT2 2

typedef struct Btor Btor;

typedef struct BtorOpt 
{
  int internal;       /* internal option? */
  const char *shrt;   /* short option identifier (may be 0) */
  const char *lng;    /* long option identifier */
  const char *desc;   /* description */
  int val;              /* value */
  int dflt;           /* default value */
  int min;            /* min value */
  int max;            /* max value */
} BtorOpt; 

#define BTOR_OPT_MODEL_GEN "model_gen"
#define BTOR_OPT_INCREMENTAL "incremental"
#define BTOR_OPT_INCREMENTAL_ALL "incremental_all"
#define BTOR_OPT_INCREMENTAL_IN_DEPTH "incremental_in_depth"
#define BTOR_OPT_INCREMENTAL_LOOK_AHEAD "incremental_look_ahead"
#define BTOR_OPT_INCREMENTAL_INTERVAL "incremental_interval"
#define BTOR_OPT_INPUT_FORMAT "input_format"
#define BTOR_OPT_OUTPUT_NUMBER_FORMAT "output_number_format"
#define BTOR_OPT_OUTPUT_FORMAT "output_format"
#define BTOR_OPT_REWRITE_LEVEL "rewrite_level"
#define BTOR_OPT_REWRITE_LEVEL_PBR "rewrite_level_pbr"
#define BTOR_OPT_BETA_REDUCE_ALL "beta_reduce_all"
#define BTOR_OPT_DUAL_PROP "dual_prop"
#define BTOR_OPT_JUST "just"
#ifndef BTOR_DO_NOT_OPTIMIZE_UNCONSTRAINED
#define BTOR_OPT_UCOPT "ucopt"
#endif
#define BTOR_OPT_AUTO_CLEANUP "auto_cleanup"
#define BTOR_OPT_PRETTY_PRINT "pretty_print"
#define BTOR_OPT_LOGLEVEL "loglevel"
#define BTOR_OPT_VERBOSITY "verbosity"
#define BTOR_OPT_SIMPLIFY_CONSTRAINTS "simplify_constraints"
#define BTOR_OPT_AUTO_CLEANUP_INTERNAL "auto_cleanup_internal"
#ifdef BTOR_CHECK_FAILED
#define BTOR_OPT_CHK_FAILED_ASSUMPTIONS "chk_failed_assumptions"
#endif
#define BTOR_OPT_PBRA "probe_beta_reduce_all"
#define BTOR_OPT_PBRA_LOD_LIMIT "pbra_lod_limit"
#define BTOR_OPT_PBRA_SAT_LIMIT "pbra_sat_limit"
#define BTOR_OPT_PBRA_OPS_FACTOR "pbra_ops_factor"
#define BTOR_OPT_UCOPT "ucopt"
#define BTOR_OPT_LAZY_SYNTHESIZE "lazy_synthesize"
#define BTOR_OPT_ELIMINATE_SLICES "eliminate_slices"

typedef struct BtorOpts 
{
  BtorOpt first;                   /* dummy for iteration */
  /* ----------------------------------------------------------------------- */
  BtorOpt model_gen;               /* model generation enabled */
  
  BtorOpt incremental;                   /* incremental usage */
  BtorOpt incremental_all;           /* incremental usage, solve all */
  BtorOpt incremental_in_depth;    /* incremental usage, in-depth mode */
  BtorOpt incremental_look_ahead;  /* incremental usage, look-ahead mode */
  BtorOpt incremental_interval;    /* incremental usage, interval mode */

  BtorOpt input_format;            /* force input format */
  
  BtorOpt output_number_format;    /* output number format */
  BtorOpt output_format;           /* output file format */

  BtorOpt rewrite_level;
  BtorOpt rewrite_level_pbr;

  BtorOpt beta_reduce_all;         /* eagerly eliminate lambda expressions */
#ifdef BTOR_ENABLE_BETA_REDUCTION_PROBING
  BtorOpt probe_beta_reduce_all;   /* probe until given LOD or SAT limit */
  BtorOpt pbra_lod_limit;          /* LOD limit for BR probing */ 
  BtorOpt pbra_sat_limit;          /* SAT limit for BR probing */
  BtorOpt pbra_ops_factor;         /* factor by which the beta reduced formula
                                      may be greater than the original */
#endif
  BtorOpt dual_prop;               /* dual prop optimization */
  BtorOpt just;                    /* justification optimization */
#ifndef BTOR_DO_NOT_OPTIMIZE_UNCONSTRAINED
  BtorOpt ucopt;                   /* unconstrained optimization */
#endif
  BtorOpt lazy_synthesize;         /* lazily synthesize expressions */
  BtorOpt eliminate_slices;        /* eliminate slices on variables */
  
  BtorOpt auto_cleanup;                   /* automatic cleanup of exps, assignment 
                                      strings (external references only) */
  BtorOpt pretty_print;            /* reindex exps and sorts when dumping */
#ifndef NBTORLOG
  BtorOpt loglevel;
#endif
  BtorOpt verbosity;

  /* internal */
  BtorOpt simplify_constraints;    /* force constraints to true/false */
  BtorOpt auto_cleanup_internal;  /* force cleanup of exps, assignm. strings 
                                      (internal references only) */
  /* ----------------------------------------------------------------------- */
  BtorOpt last;                     /* dummy for iteration */
#ifdef BTOR_CHECK_FAILED
  BtorOpt chk_failed_assumptions;
#endif

} BtorOpts;

void btor_init_opts (Btor * btor);

void btor_set_opt (Btor * btor, const char * name, int val);

/* does not assert existing opt with name 'name', 
 * not for boolector internal use */
BtorOpt * btor_get_opt_aux (Btor * btor, const char * name, int skip_internal);
/* asserts existing opt with name 'opt' */
BtorOpt * btor_get_opt (Btor * btor, const char * name);

int btor_get_opt_val (Btor * btor, const char * name);
int btor_get_opt_min (Btor * btor, const char * name);
int btor_get_opt_max (Btor * btor, const char * name);
int btor_get_opt_dflt (Btor * btor, const char * name);
const char * btor_get_opt_shrt (Btor * btor, const char * name);
const char * btor_get_opt_desc (Btor * btor, const char * name);

const char * btor_first_opt (Btor * btor);
const char * btor_next_opt (Btor * btor, const char * cur);
#endif
