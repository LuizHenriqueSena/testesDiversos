/*  Boolector: Satisfiablity Modulo Theories (SMT) solver.
 *
 *  Copyright (C) 2007-2009 Robert Daniel Brummayer.
 *  Copyright (C) 2007-2012 Armin Biere.
 *  Copyright (C) 2012-2014 Mathias Preiner.
 *  Copyright (C) 2014 Aina Niemetz.
 *
 *  All rights reserved.
 *
 *  This file is part of Boolector.
 *  See COPYING for more information on using this software.
 */

#include "btoriter.h"
#include "btorhash.h"

/*------------------------------------------------------------------------*/
/* node iterators                                                          */
/*------------------------------------------------------------------------*/

void
init_apply_parent_iterator (BtorNodeIterator * it, BtorNode * exp)
{
  assert (it);
  assert (exp);
  it->cur = BTOR_REAL_ADDR_NODE (exp)->last_parent;
}

int
has_next_parent_apply_parent_iterator (BtorNodeIterator * it)
{
  assert (it);
  /* function child of apply is at position 0, so cur is not tagged */
  return it->cur && BTOR_IS_APPLY_NODE (it->cur);
}

BtorNode *
next_parent_apply_parent_iterator (BtorNodeIterator * it)
{
  BtorNode *result;
  assert (it);
  result = it->cur;
  assert (result);
  it->cur = BTOR_REAL_ADDR_NODE (BTOR_PREV_PARENT (result));
  assert (BTOR_IS_REGULAR_NODE (result));
  assert (BTOR_IS_APPLY_NODE (result));
  return result;
}

/*------------------------------------------------------------------------*/

void
init_full_parent_iterator (BtorNodeIterator * it, BtorNode * exp)
{
  assert (it);
  assert (exp);
  it->cur = BTOR_REAL_ADDR_NODE (exp)->first_parent;
}

int
has_next_parent_full_parent_iterator (BtorNodeIterator * it)
{
  assert (it);
  return it->cur != 0;
}

BtorNode *
next_parent_full_parent_iterator (BtorNodeIterator * it)
{
  assert (it);

  BtorNode *result;
  result = it->cur;
  assert (result);
  it->cur = BTOR_NEXT_PARENT (result);

  return BTOR_REAL_ADDR_NODE (result);
}

/*------------------------------------------------------------------------*/

void
init_args_iterator (BtorArgsIterator * it, BtorNode * exp)
{
  assert (it);
  assert (exp);
  assert (BTOR_IS_REGULAR_NODE (exp));
  assert (BTOR_IS_ARGS_NODE (exp));

  it->pos = 0;
  it->exp = exp;
  it->cur = exp->e[0];
}

int
has_next_args_iterator (BtorArgsIterator * it)
{
  assert (it);
  return it->cur != 0;
}

BtorNode *
next_args_iterator (BtorArgsIterator * it)
{
  assert (it);
  assert (it->cur);

  BtorNode *result;

  result = it->cur;

  /* end of this args node, continue with next */
  if (BTOR_IS_ARGS_NODE (BTOR_REAL_ADDR_NODE (result)))
    {
      assert (it->pos == 2);
      assert (BTOR_IS_REGULAR_NODE (result));
      it->pos = 0;
      it->exp = result;
      it->cur = result->e[0];
      result = it->cur;
    }

  /* prepare next argument */
  it->pos++;
  if (it->pos < it->exp->arity)
    it->cur = it->exp->e[it->pos];
  else
    it->cur = 0;

  assert (!BTOR_IS_ARGS_NODE (BTOR_REAL_ADDR_NODE (result)));
  return result;
}

/*------------------------------------------------------------------------*/

void
init_lambda_iterator (BtorNodeIterator * it, BtorNode * exp)
{
  assert (it);
  assert (exp);
  assert (BTOR_IS_REGULAR_NODE (exp));
  assert (BTOR_IS_LAMBDA_NODE (exp));

  it->cur = exp;
}

BtorNode *
next_lambda_iterator (BtorNodeIterator * it)
{
  assert (it);
  assert (it->cur);

  BtorNode *result;
  result = it->cur;
  it->cur = result->e[1];
  return result;
}

int
has_next_lambda_iterator (BtorNodeIterator * it)
{
  assert (it);
  assert (it->cur);
  return BTOR_IS_LAMBDA_NODE (BTOR_REAL_ADDR_NODE (it->cur));
}

/*------------------------------------------------------------------------*/

void
init_parameterized_iterator (Btor * btor, BtorParameterizedIterator * it,
                             BtorNode * exp)
{
  assert (btor);
  assert (it);
  assert (exp);
  assert (BTOR_IS_REGULAR_NODE (exp));

  BtorPtrHashBucket *b;

  if (BTOR_IS_PARAM_NODE (exp))
    {
      it->num_params = 1;
      it->cur = exp;
      it->bucket = 0;
      return;
    }

  b = btor_find_in_ptr_hash_table (btor->parameterized, exp);
  if (b)
    {
      assert (b->data.asPtr);
      it->bucket = ((BtorPtrHashTable *) b->data.asPtr)->first;
      it->cur = (BtorNode *) it->bucket->key;
      it->num_params = ((BtorPtrHashTable *) b->data.asPtr)->count;
    }
  else
    {
      it->cur = 0;
      it->bucket = 0;
      it->num_params = 0;
    }
}

BtorNode *
next_parameterized_iterator (BtorParameterizedIterator * it)
{
  assert (it);
  assert (it->cur);

  BtorNode *result;
  result = it->cur;
  if (it->bucket)
    it->bucket = it->bucket->next;
  it->cur = it->bucket ? (BtorNode *) it->bucket->key : 0;
  return result;
}

int
has_next_parameterized_iterator (BtorParameterizedIterator * it)
{
  assert (it);
  return it->cur != 0;
}


/*------------------------------------------------------------------------*/
/* hash table iterators                                                          */
/*------------------------------------------------------------------------*/

void
init_hash_table_iterator (BtorHashTableIterator * it, BtorPtrHashTable * t)
{
  assert (it);
  assert (t);

  it->bucket = t->first;
  it->cur = it->bucket ? it->bucket->key : 0;
  it->reversed = 0;
  it->num_queued = 0;
  it->pos = 0;
}

void
init_reversed_hash_table_iterator (BtorHashTableIterator * it,
                                   BtorPtrHashTable * t)
{
  assert (it);
  assert (t);

  it->bucket = t->last;
  it->cur = it->bucket ? it->bucket->key : 0;
  it->reversed = 1;
  it->num_queued = 0;
  it->pos = 0;
}

void
queue_hash_table_iterator (BtorHashTableIterator * it,
                           BtorPtrHashTable * t)
{
  assert (it);
  assert (t);
  assert (it->num_queued < BTOR_HASH_TABLE_ITERATOR_STACK_SIZE);

  /* if initial table is empty, initialize with queued table */
  if (!it->bucket)
    {
      it->bucket = t->first;
      it->cur = it->bucket ? it->bucket->key : 0;
    }
  else
    {
      it->stack[it->num_queued++] = t;
    }
}

int
has_next_hash_table_iterator (BtorHashTableIterator * it)
{
  assert (it);
  return it->cur != 0;
}

void *
next_hash_table_iterator (BtorHashTableIterator * it)
{
  assert (it);
  assert (it->bucket);
  assert (it->cur);

  void *res;
  res = it->cur;
  if (it->bucket)
    it->bucket = it->reversed ? it->bucket->prev : it->bucket->next;

  while (!it->bucket && it->pos < it->num_queued)
    it->bucket =
      it->reversed ? it->stack[it->pos++]->last : it->stack[it->pos++]->first;

  it->cur = it->bucket ? it->bucket->key : 0; 
  return res;
}

BtorPtrHashData *
next_data_hash_table_iterator (BtorHashTableIterator * it)
{
  assert (it);
  assert (it->bucket);
  assert (it->cur);

  void *res;

  res = &it->bucket->data;

  if (it->bucket)
    it->bucket = it->reversed ? it->bucket->prev : it->bucket->next;

  while (!it->bucket && it->pos < it->num_queued)
    it->bucket =
      it->reversed ? it->stack[it->pos++]->last : it->stack[it->pos++]->first;

  it->cur = it->bucket ? it->bucket->key : 0; 
  return res;
}

/*------------------------------------------------------------------------*/

void
init_node_hash_table_iterator (BtorHashTableIterator * it, BtorPtrHashTable * t)
{
  assert (it);
  assert (t);
  init_hash_table_iterator (it, t);
}

void
init_reversed_node_hash_table_iterator (BtorHashTableIterator * it,
                                        BtorPtrHashTable * t)
{
  assert (it);
  assert (t);
  init_reversed_hash_table_iterator (it, t);
}

void
queue_node_hash_table_iterator (BtorHashTableIterator * it,
                                BtorPtrHashTable * t)
{
  assert (it);
  assert (t);
  assert (it->num_queued < BTOR_HASH_TABLE_ITERATOR_STACK_SIZE);
  queue_hash_table_iterator (it, t);
}

int
has_next_node_hash_table_iterator (BtorHashTableIterator * it)
{
  assert (it);
  return has_next_hash_table_iterator (it);
}

BtorNode *
next_node_hash_table_iterator (BtorHashTableIterator * it)
{
  assert (it);
  assert (it->bucket);
  assert (it->cur);
  return (BtorNode *) next_hash_table_iterator (it);
}

BtorPtrHashData *
next_data_node_hash_table_iterator (BtorHashTableIterator * it)
{
  assert (it);
  assert (it->bucket);
  assert (it->cur);
  return next_data_hash_table_iterator (it);
}

/*------------------------------------------------------------------------*/
/* map iterators                                                          */
/*------------------------------------------------------------------------*/

void 
init_node_map_iterator (BtorNodeMapIterator * it, BtorNodeMap * map)
{
  assert (map);
  init_node_hash_table_iterator (&it->it, map->table);
}

void 
init_reversed_node_map_iterator (BtorNodeMapIterator * it, BtorNodeMap * map)
{
  assert (map);
  init_reversed_node_hash_table_iterator (&it->it, map->table);
}

int
has_next_node_map_iterator (BtorNodeMapIterator * it)
{
  return has_next_node_hash_table_iterator (&it->it);
}

void
queue_node_map_iterator (BtorNodeMapIterator * it, BtorNodeMap * map)
{
  assert (map);
  queue_node_hash_table_iterator (&it->it, map->table);
}

BtorNode * 
next_node_map_iterator (BtorNodeMapIterator * it)
{
  return next_node_hash_table_iterator (&it->it);
  
}

BtorPtrHashData *
next_data_node_map_iterator (BtorNodeMapIterator * it)
{
  return next_data_node_hash_table_iterator (&it->it);
}

/*------------------------------------------------------------------------*/

