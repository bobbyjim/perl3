#define WORD 257
#define APPEND 258
#define OPEN 259
#define SELECT 260
#define LOOPEX 261
#define USING 262
#define FORMAT 263
#define DO 264
#define SHIFT 265
#define PUSH 266
#define POP 267
#define LVALFUN 268
#define WHILE 269
#define UNTIL 270
#define IF 271
#define UNLESS 272
#define ELSE 273
#define ELSIF 274
#define CONTINUE 275
#define SPLIT 276
#define FLIST 277
#define FOR 278
#define FILOP 279
#define FILOP2 280
#define FILOP3 281
#define FILOP4 282
#define FILOP22 283
#define FILOP25 284
#define FUNC0 285
#define FUNC1 286
#define FUNC2 287
#define FUNC3 288
#define HSHFUN 289
#define HSHFUN3 290
#define FLIST2 291
#define SUB 292
#define FILETEST 293
#define LOCAL 294
#define DELETE 295
#define RELOP 296
#define EQOP 297
#define MULOP 298
#define ADDOP 299
#define PACKAGE 300
#define AMPER 301
#define LFUNC4 302
#define FORMLIST 303
#define REG 304
#define ARYLEN 305
#define ARY 306
#define HSH 307
#define STAR 308
#define SUBST 309
#define PATTERN 310
#define RSTRING 311
#define TRANS 312
#define LISTOP 313
#define DOTDOT 314
#define OROR 315
#define ANDAND 316
#define UNIOP 317
#define LS 318
#define RS 319
#define MATCH 320
#define NMATCH 321
#define UMINUS 322
#define POW 323
#define INC 324
#define DEC 325
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union {
    int	ival;
    char *cval;
    ARG *arg;
    CMD *cmdval;
    struct compcmd compval;
    STAB *stabval;
    FCMD *formval;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
