
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 86 09 00 	movl   $0x986,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 7a 05 00 00       	call   5ba <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 21 02 00 00       	call   27d <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 22                	jmp    8b <main+0x8b>
    if(fork(0,0) > 0)
  69:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  70:	00 
  71:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  78:	e8 a5 03 00 00       	call   422 <fork>
  7d:	85 c0                	test   %eax,%eax
  7f:	7e 02                	jle    83 <main+0x83>
      break;
  81:	eb 12                	jmp    95 <main+0x95>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  83:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  8a:	01 
  8b:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  92:	03 
  93:	7e d4                	jle    69 <main+0x69>
    if(fork(0,0) > 0)
      break;

  printf(1, "write %d\n", i);
  95:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  9c:	89 44 24 08          	mov    %eax,0x8(%esp)
  a0:	c7 44 24 04 99 09 00 	movl   $0x999,0x4(%esp)
  a7:	00 
  a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  af:	e8 06 05 00 00       	call   5ba <printf>

  path[8] += i;
  b4:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  bb:	00 
  bc:	89 c2                	mov    %eax,%edx
  be:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  c5:	01 d0                	add    %edx,%eax
  c7:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  ce:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  d5:	00 
  d6:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  dd:	89 04 24             	mov    %eax,(%esp)
  e0:	e8 85 03 00 00       	call   46a <open>
  e5:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  ec:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  f3:	00 00 00 00 
  f7:	eb 27                	jmp    120 <main+0x120>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  f9:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 100:	00 
 101:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 105:	89 44 24 04          	mov    %eax,0x4(%esp)
 109:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 32 03 00 00       	call   44a <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
 118:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 11f:	01 
 120:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 127:	13 
 128:	7e cf                	jle    f9 <main+0xf9>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
 12a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 131:	89 04 24             	mov    %eax,(%esp)
 134:	e8 19 03 00 00       	call   452 <close>

  printf(1, "read\n");
 139:	c7 44 24 04 a3 09 00 	movl   $0x9a3,0x4(%esp)
 140:	00 
 141:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 148:	e8 6d 04 00 00       	call   5ba <printf>

  fd = open(path, O_RDONLY);
 14d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 154:	00 
 155:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 15c:	89 04 24             	mov    %eax,(%esp)
 15f:	e8 06 03 00 00       	call   46a <open>
 164:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 16b:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 172:	00 00 00 00 
 176:	eb 27                	jmp    19f <main+0x19f>
    read(fd, data, sizeof(data));
 178:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 17f:	00 
 180:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 184:	89 44 24 04          	mov    %eax,0x4(%esp)
 188:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 18f:	89 04 24             	mov    %eax,(%esp)
 192:	e8 ab 02 00 00       	call   442 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 197:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 19e:	01 
 19f:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 1a6:	13 
 1a7:	7e cf                	jle    178 <main+0x178>
    read(fd, data, sizeof(data));
  close(fd);
 1a9:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1b0:	89 04 24             	mov    %eax,(%esp)
 1b3:	e8 9a 02 00 00       	call   452 <close>

  wait();
 1b8:	e8 75 02 00 00       	call   432 <wait>
  
  exit();
 1bd:	e8 68 02 00 00       	call   42a <exit>

000001c2 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	57                   	push   %edi
 1c6:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1ca:	8b 55 10             	mov    0x10(%ebp),%edx
 1cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d0:	89 cb                	mov    %ecx,%ebx
 1d2:	89 df                	mov    %ebx,%edi
 1d4:	89 d1                	mov    %edx,%ecx
 1d6:	fc                   	cld    
 1d7:	f3 aa                	rep stos %al,%es:(%edi)
 1d9:	89 ca                	mov    %ecx,%edx
 1db:	89 fb                	mov    %edi,%ebx
 1dd:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1e0:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1e3:	5b                   	pop    %ebx
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1ed:	8b 45 08             	mov    0x8(%ebp),%eax
 1f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1f3:	90                   	nop
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	8d 50 01             	lea    0x1(%eax),%edx
 1fa:	89 55 08             	mov    %edx,0x8(%ebp)
 1fd:	8b 55 0c             	mov    0xc(%ebp),%edx
 200:	8d 4a 01             	lea    0x1(%edx),%ecx
 203:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 206:	0f b6 12             	movzbl (%edx),%edx
 209:	88 10                	mov    %dl,(%eax)
 20b:	0f b6 00             	movzbl (%eax),%eax
 20e:	84 c0                	test   %al,%al
 210:	75 e2                	jne    1f4 <strcpy+0xd>
    ;
  return os;
 212:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 21a:	eb 08                	jmp    224 <strcmp+0xd>
    p++, q++;
 21c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 220:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	84 c0                	test   %al,%al
 22c:	74 10                	je     23e <strcmp+0x27>
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	0f b6 10             	movzbl (%eax),%edx
 234:	8b 45 0c             	mov    0xc(%ebp),%eax
 237:	0f b6 00             	movzbl (%eax),%eax
 23a:	38 c2                	cmp    %al,%dl
 23c:	74 de                	je     21c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	0f b6 00             	movzbl (%eax),%eax
 244:	0f b6 d0             	movzbl %al,%edx
 247:	8b 45 0c             	mov    0xc(%ebp),%eax
 24a:	0f b6 00             	movzbl (%eax),%eax
 24d:	0f b6 c0             	movzbl %al,%eax
 250:	29 c2                	sub    %eax,%edx
 252:	89 d0                	mov    %edx,%eax
}
 254:	5d                   	pop    %ebp
 255:	c3                   	ret    

00000256 <strlen>:

uint
strlen(char *s)
{
 256:	55                   	push   %ebp
 257:	89 e5                	mov    %esp,%ebp
 259:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 25c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 263:	eb 04                	jmp    269 <strlen+0x13>
 265:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 269:	8b 55 fc             	mov    -0x4(%ebp),%edx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	01 d0                	add    %edx,%eax
 271:	0f b6 00             	movzbl (%eax),%eax
 274:	84 c0                	test   %al,%al
 276:	75 ed                	jne    265 <strlen+0xf>
    ;
  return n;
 278:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 27b:	c9                   	leave  
 27c:	c3                   	ret    

0000027d <memset>:

void*
memset(void *dst, int c, uint n)
{
 27d:	55                   	push   %ebp
 27e:	89 e5                	mov    %esp,%ebp
 280:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 283:	8b 45 10             	mov    0x10(%ebp),%eax
 286:	89 44 24 08          	mov    %eax,0x8(%esp)
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 44 24 04          	mov    %eax,0x4(%esp)
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	89 04 24             	mov    %eax,(%esp)
 297:	e8 26 ff ff ff       	call   1c2 <stosb>
  return dst;
 29c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <strchr>:

char*
strchr(const char *s, char c)
{
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	83 ec 04             	sub    $0x4,%esp
 2a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2aa:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2ad:	eb 14                	jmp    2c3 <strchr+0x22>
    if(*s == c)
 2af:	8b 45 08             	mov    0x8(%ebp),%eax
 2b2:	0f b6 00             	movzbl (%eax),%eax
 2b5:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2b8:	75 05                	jne    2bf <strchr+0x1e>
      return (char*)s;
 2ba:	8b 45 08             	mov    0x8(%ebp),%eax
 2bd:	eb 13                	jmp    2d2 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2bf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	0f b6 00             	movzbl (%eax),%eax
 2c9:	84 c0                	test   %al,%al
 2cb:	75 e2                	jne    2af <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2cd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2d2:	c9                   	leave  
 2d3:	c3                   	ret    

000002d4 <gets>:

char*
gets(char *buf, int max)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2e1:	eb 4c                	jmp    32f <gets+0x5b>
    cc = read(0, &c, 1);
 2e3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2ea:	00 
 2eb:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2ee:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2f9:	e8 44 01 00 00       	call   442 <read>
 2fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 301:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 305:	7f 02                	jg     309 <gets+0x35>
      break;
 307:	eb 31                	jmp    33a <gets+0x66>
    buf[i++] = c;
 309:	8b 45 f4             	mov    -0xc(%ebp),%eax
 30c:	8d 50 01             	lea    0x1(%eax),%edx
 30f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 312:	89 c2                	mov    %eax,%edx
 314:	8b 45 08             	mov    0x8(%ebp),%eax
 317:	01 c2                	add    %eax,%edx
 319:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 31f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 323:	3c 0a                	cmp    $0xa,%al
 325:	74 13                	je     33a <gets+0x66>
 327:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 32b:	3c 0d                	cmp    $0xd,%al
 32d:	74 0b                	je     33a <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 332:	83 c0 01             	add    $0x1,%eax
 335:	3b 45 0c             	cmp    0xc(%ebp),%eax
 338:	7c a9                	jl     2e3 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 33a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
 340:	01 d0                	add    %edx,%eax
 342:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 345:	8b 45 08             	mov    0x8(%ebp),%eax
}
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <stat>:

int
stat(char *n, struct stat *st)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 350:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 357:	00 
 358:	8b 45 08             	mov    0x8(%ebp),%eax
 35b:	89 04 24             	mov    %eax,(%esp)
 35e:	e8 07 01 00 00       	call   46a <open>
 363:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 366:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 36a:	79 07                	jns    373 <stat+0x29>
    return -1;
 36c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 371:	eb 23                	jmp    396 <stat+0x4c>
  r = fstat(fd, st);
 373:	8b 45 0c             	mov    0xc(%ebp),%eax
 376:	89 44 24 04          	mov    %eax,0x4(%esp)
 37a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37d:	89 04 24             	mov    %eax,(%esp)
 380:	e8 fd 00 00 00       	call   482 <fstat>
 385:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 388:	8b 45 f4             	mov    -0xc(%ebp),%eax
 38b:	89 04 24             	mov    %eax,(%esp)
 38e:	e8 bf 00 00 00       	call   452 <close>
  return r;
 393:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <atoi>:

int
atoi(const char *s)
{
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 39e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3a5:	eb 25                	jmp    3cc <atoi+0x34>
    n = n*10 + *s++ - '0';
 3a7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3aa:	89 d0                	mov    %edx,%eax
 3ac:	c1 e0 02             	shl    $0x2,%eax
 3af:	01 d0                	add    %edx,%eax
 3b1:	01 c0                	add    %eax,%eax
 3b3:	89 c1                	mov    %eax,%ecx
 3b5:	8b 45 08             	mov    0x8(%ebp),%eax
 3b8:	8d 50 01             	lea    0x1(%eax),%edx
 3bb:	89 55 08             	mov    %edx,0x8(%ebp)
 3be:	0f b6 00             	movzbl (%eax),%eax
 3c1:	0f be c0             	movsbl %al,%eax
 3c4:	01 c8                	add    %ecx,%eax
 3c6:	83 e8 30             	sub    $0x30,%eax
 3c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 00             	movzbl (%eax),%eax
 3d2:	3c 2f                	cmp    $0x2f,%al
 3d4:	7e 0a                	jle    3e0 <atoi+0x48>
 3d6:	8b 45 08             	mov    0x8(%ebp),%eax
 3d9:	0f b6 00             	movzbl (%eax),%eax
 3dc:	3c 39                	cmp    $0x39,%al
 3de:	7e c7                	jle    3a7 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3e3:	c9                   	leave  
 3e4:	c3                   	ret    

000003e5 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3eb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3f7:	eb 17                	jmp    410 <memmove+0x2b>
    *dst++ = *src++;
 3f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3fc:	8d 50 01             	lea    0x1(%eax),%edx
 3ff:	89 55 fc             	mov    %edx,-0x4(%ebp)
 402:	8b 55 f8             	mov    -0x8(%ebp),%edx
 405:	8d 4a 01             	lea    0x1(%edx),%ecx
 408:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 40b:	0f b6 12             	movzbl (%edx),%edx
 40e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 410:	8b 45 10             	mov    0x10(%ebp),%eax
 413:	8d 50 ff             	lea    -0x1(%eax),%edx
 416:	89 55 10             	mov    %edx,0x10(%ebp)
 419:	85 c0                	test   %eax,%eax
 41b:	7f dc                	jg     3f9 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 41d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 420:	c9                   	leave  
 421:	c3                   	ret    

00000422 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 422:	b8 01 00 00 00       	mov    $0x1,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <exit>:
SYSCALL(exit)
 42a:	b8 02 00 00 00       	mov    $0x2,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <wait>:
SYSCALL(wait)
 432:	b8 03 00 00 00       	mov    $0x3,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <pipe>:
SYSCALL(pipe)
 43a:	b8 04 00 00 00       	mov    $0x4,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <read>:
SYSCALL(read)
 442:	b8 05 00 00 00       	mov    $0x5,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <write>:
SYSCALL(write)
 44a:	b8 10 00 00 00       	mov    $0x10,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <close>:
SYSCALL(close)
 452:	b8 15 00 00 00       	mov    $0x15,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <kill>:
SYSCALL(kill)
 45a:	b8 06 00 00 00       	mov    $0x6,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <exec>:
SYSCALL(exec)
 462:	b8 07 00 00 00       	mov    $0x7,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <open>:
SYSCALL(open)
 46a:	b8 0f 00 00 00       	mov    $0xf,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <mknod>:
SYSCALL(mknod)
 472:	b8 11 00 00 00       	mov    $0x11,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <unlink>:
SYSCALL(unlink)
 47a:	b8 12 00 00 00       	mov    $0x12,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <fstat>:
SYSCALL(fstat)
 482:	b8 08 00 00 00       	mov    $0x8,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <link>:
SYSCALL(link)
 48a:	b8 13 00 00 00       	mov    $0x13,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <mkdir>:
SYSCALL(mkdir)
 492:	b8 14 00 00 00       	mov    $0x14,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <chdir>:
SYSCALL(chdir)
 49a:	b8 09 00 00 00       	mov    $0x9,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <dup>:
SYSCALL(dup)
 4a2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <getpid>:
SYSCALL(getpid)
 4aa:	b8 0b 00 00 00       	mov    $0xb,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <sbrk>:
SYSCALL(sbrk)
 4b2:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <sleep>:
SYSCALL(sleep)
 4ba:	b8 0d 00 00 00       	mov    $0xd,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <uptime>:
SYSCALL(uptime)
 4c2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <hello>:
SYSCALL(hello)
 4ca:	b8 16 00 00 00       	mov    $0x16,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <cps>:
SYSCALL(cps)
 4d2:	b8 17 00 00 00       	mov    $0x17,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4da:	55                   	push   %ebp
 4db:	89 e5                	mov    %esp,%ebp
 4dd:	83 ec 18             	sub    $0x18,%esp
 4e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e3:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4e6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ed:	00 
 4ee:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4f1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f5:	8b 45 08             	mov    0x8(%ebp),%eax
 4f8:	89 04 24             	mov    %eax,(%esp)
 4fb:	e8 4a ff ff ff       	call   44a <write>
}
 500:	c9                   	leave  
 501:	c3                   	ret    

00000502 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 502:	55                   	push   %ebp
 503:	89 e5                	mov    %esp,%ebp
 505:	56                   	push   %esi
 506:	53                   	push   %ebx
 507:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 50a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 511:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 515:	74 17                	je     52e <printint+0x2c>
 517:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 51b:	79 11                	jns    52e <printint+0x2c>
    neg = 1;
 51d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 524:	8b 45 0c             	mov    0xc(%ebp),%eax
 527:	f7 d8                	neg    %eax
 529:	89 45 ec             	mov    %eax,-0x14(%ebp)
 52c:	eb 06                	jmp    534 <printint+0x32>
  } else {
    x = xx;
 52e:	8b 45 0c             	mov    0xc(%ebp),%eax
 531:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 534:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 53b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 53e:	8d 41 01             	lea    0x1(%ecx),%eax
 541:	89 45 f4             	mov    %eax,-0xc(%ebp)
 544:	8b 5d 10             	mov    0x10(%ebp),%ebx
 547:	8b 45 ec             	mov    -0x14(%ebp),%eax
 54a:	ba 00 00 00 00       	mov    $0x0,%edx
 54f:	f7 f3                	div    %ebx
 551:	89 d0                	mov    %edx,%eax
 553:	0f b6 80 f4 0b 00 00 	movzbl 0xbf4(%eax),%eax
 55a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 55e:	8b 75 10             	mov    0x10(%ebp),%esi
 561:	8b 45 ec             	mov    -0x14(%ebp),%eax
 564:	ba 00 00 00 00       	mov    $0x0,%edx
 569:	f7 f6                	div    %esi
 56b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 56e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 572:	75 c7                	jne    53b <printint+0x39>
  if(neg)
 574:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 578:	74 10                	je     58a <printint+0x88>
    buf[i++] = '-';
 57a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57d:	8d 50 01             	lea    0x1(%eax),%edx
 580:	89 55 f4             	mov    %edx,-0xc(%ebp)
 583:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 588:	eb 1f                	jmp    5a9 <printint+0xa7>
 58a:	eb 1d                	jmp    5a9 <printint+0xa7>
    putc(fd, buf[i]);
 58c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 58f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 592:	01 d0                	add    %edx,%eax
 594:	0f b6 00             	movzbl (%eax),%eax
 597:	0f be c0             	movsbl %al,%eax
 59a:	89 44 24 04          	mov    %eax,0x4(%esp)
 59e:	8b 45 08             	mov    0x8(%ebp),%eax
 5a1:	89 04 24             	mov    %eax,(%esp)
 5a4:	e8 31 ff ff ff       	call   4da <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5a9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5ad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5b1:	79 d9                	jns    58c <printint+0x8a>
    putc(fd, buf[i]);
}
 5b3:	83 c4 30             	add    $0x30,%esp
 5b6:	5b                   	pop    %ebx
 5b7:	5e                   	pop    %esi
 5b8:	5d                   	pop    %ebp
 5b9:	c3                   	ret    

000005ba <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5ba:	55                   	push   %ebp
 5bb:	89 e5                	mov    %esp,%ebp
 5bd:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5c0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5c7:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ca:	83 c0 04             	add    $0x4,%eax
 5cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5d7:	e9 7c 01 00 00       	jmp    758 <printf+0x19e>
    c = fmt[i] & 0xff;
 5dc:	8b 55 0c             	mov    0xc(%ebp),%edx
 5df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5e2:	01 d0                	add    %edx,%eax
 5e4:	0f b6 00             	movzbl (%eax),%eax
 5e7:	0f be c0             	movsbl %al,%eax
 5ea:	25 ff 00 00 00       	and    $0xff,%eax
 5ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5f6:	75 2c                	jne    624 <printf+0x6a>
      if(c == '%'){
 5f8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5fc:	75 0c                	jne    60a <printf+0x50>
        state = '%';
 5fe:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 605:	e9 4a 01 00 00       	jmp    754 <printf+0x19a>
      } else {
        putc(fd, c);
 60a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 60d:	0f be c0             	movsbl %al,%eax
 610:	89 44 24 04          	mov    %eax,0x4(%esp)
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	89 04 24             	mov    %eax,(%esp)
 61a:	e8 bb fe ff ff       	call   4da <putc>
 61f:	e9 30 01 00 00       	jmp    754 <printf+0x19a>
      }
    } else if(state == '%'){
 624:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 628:	0f 85 26 01 00 00    	jne    754 <printf+0x19a>
      if(c == 'd'){
 62e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 632:	75 2d                	jne    661 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 634:	8b 45 e8             	mov    -0x18(%ebp),%eax
 637:	8b 00                	mov    (%eax),%eax
 639:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 640:	00 
 641:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 648:	00 
 649:	89 44 24 04          	mov    %eax,0x4(%esp)
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	89 04 24             	mov    %eax,(%esp)
 653:	e8 aa fe ff ff       	call   502 <printint>
        ap++;
 658:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65c:	e9 ec 00 00 00       	jmp    74d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 661:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 665:	74 06                	je     66d <printf+0xb3>
 667:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 66b:	75 2d                	jne    69a <printf+0xe0>
        printint(fd, *ap, 16, 0);
 66d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
 672:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 679:	00 
 67a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 681:	00 
 682:	89 44 24 04          	mov    %eax,0x4(%esp)
 686:	8b 45 08             	mov    0x8(%ebp),%eax
 689:	89 04 24             	mov    %eax,(%esp)
 68c:	e8 71 fe ff ff       	call   502 <printint>
        ap++;
 691:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 695:	e9 b3 00 00 00       	jmp    74d <printf+0x193>
      } else if(c == 's'){
 69a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 69e:	75 45                	jne    6e5 <printf+0x12b>
        s = (char*)*ap;
 6a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a3:	8b 00                	mov    (%eax),%eax
 6a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6a8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6b0:	75 09                	jne    6bb <printf+0x101>
          s = "(null)";
 6b2:	c7 45 f4 a9 09 00 00 	movl   $0x9a9,-0xc(%ebp)
        while(*s != 0){
 6b9:	eb 1e                	jmp    6d9 <printf+0x11f>
 6bb:	eb 1c                	jmp    6d9 <printf+0x11f>
          putc(fd, *s);
 6bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c0:	0f b6 00             	movzbl (%eax),%eax
 6c3:	0f be c0             	movsbl %al,%eax
 6c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 6cd:	89 04 24             	mov    %eax,(%esp)
 6d0:	e8 05 fe ff ff       	call   4da <putc>
          s++;
 6d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6dc:	0f b6 00             	movzbl (%eax),%eax
 6df:	84 c0                	test   %al,%al
 6e1:	75 da                	jne    6bd <printf+0x103>
 6e3:	eb 68                	jmp    74d <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6e5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6e9:	75 1d                	jne    708 <printf+0x14e>
        putc(fd, *ap);
 6eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ee:	8b 00                	mov    (%eax),%eax
 6f0:	0f be c0             	movsbl %al,%eax
 6f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 d8 fd ff ff       	call   4da <putc>
        ap++;
 702:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 706:	eb 45                	jmp    74d <printf+0x193>
      } else if(c == '%'){
 708:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 70c:	75 17                	jne    725 <printf+0x16b>
        putc(fd, c);
 70e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 711:	0f be c0             	movsbl %al,%eax
 714:	89 44 24 04          	mov    %eax,0x4(%esp)
 718:	8b 45 08             	mov    0x8(%ebp),%eax
 71b:	89 04 24             	mov    %eax,(%esp)
 71e:	e8 b7 fd ff ff       	call   4da <putc>
 723:	eb 28                	jmp    74d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 725:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 72c:	00 
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	89 04 24             	mov    %eax,(%esp)
 733:	e8 a2 fd ff ff       	call   4da <putc>
        putc(fd, c);
 738:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73b:	0f be c0             	movsbl %al,%eax
 73e:	89 44 24 04          	mov    %eax,0x4(%esp)
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	89 04 24             	mov    %eax,(%esp)
 748:	e8 8d fd ff ff       	call   4da <putc>
      }
      state = 0;
 74d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 754:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 758:	8b 55 0c             	mov    0xc(%ebp),%edx
 75b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75e:	01 d0                	add    %edx,%eax
 760:	0f b6 00             	movzbl (%eax),%eax
 763:	84 c0                	test   %al,%al
 765:	0f 85 71 fe ff ff    	jne    5dc <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 76b:	c9                   	leave  
 76c:	c3                   	ret    

0000076d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 76d:	55                   	push   %ebp
 76e:	89 e5                	mov    %esp,%ebp
 770:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 773:	8b 45 08             	mov    0x8(%ebp),%eax
 776:	83 e8 08             	sub    $0x8,%eax
 779:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77c:	a1 10 0c 00 00       	mov    0xc10,%eax
 781:	89 45 fc             	mov    %eax,-0x4(%ebp)
 784:	eb 24                	jmp    7aa <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 786:	8b 45 fc             	mov    -0x4(%ebp),%eax
 789:	8b 00                	mov    (%eax),%eax
 78b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 78e:	77 12                	ja     7a2 <free+0x35>
 790:	8b 45 f8             	mov    -0x8(%ebp),%eax
 793:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 796:	77 24                	ja     7bc <free+0x4f>
 798:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79b:	8b 00                	mov    (%eax),%eax
 79d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a0:	77 1a                	ja     7bc <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a5:	8b 00                	mov    (%eax),%eax
 7a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ad:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b0:	76 d4                	jbe    786 <free+0x19>
 7b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b5:	8b 00                	mov    (%eax),%eax
 7b7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ba:	76 ca                	jbe    786 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bf:	8b 40 04             	mov    0x4(%eax),%eax
 7c2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cc:	01 c2                	add    %eax,%edx
 7ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d1:	8b 00                	mov    (%eax),%eax
 7d3:	39 c2                	cmp    %eax,%edx
 7d5:	75 24                	jne    7fb <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7da:	8b 50 04             	mov    0x4(%eax),%edx
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	8b 00                	mov    (%eax),%eax
 7e2:	8b 40 04             	mov    0x4(%eax),%eax
 7e5:	01 c2                	add    %eax,%edx
 7e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ea:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f0:	8b 00                	mov    (%eax),%eax
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f7:	89 10                	mov    %edx,(%eax)
 7f9:	eb 0a                	jmp    805 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fe:	8b 10                	mov    (%eax),%edx
 800:	8b 45 f8             	mov    -0x8(%ebp),%eax
 803:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 805:	8b 45 fc             	mov    -0x4(%ebp),%eax
 808:	8b 40 04             	mov    0x4(%eax),%eax
 80b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	01 d0                	add    %edx,%eax
 817:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 81a:	75 20                	jne    83c <free+0xcf>
    p->s.size += bp->s.size;
 81c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81f:	8b 50 04             	mov    0x4(%eax),%edx
 822:	8b 45 f8             	mov    -0x8(%ebp),%eax
 825:	8b 40 04             	mov    0x4(%eax),%eax
 828:	01 c2                	add    %eax,%edx
 82a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 830:	8b 45 f8             	mov    -0x8(%ebp),%eax
 833:	8b 10                	mov    (%eax),%edx
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	89 10                	mov    %edx,(%eax)
 83a:	eb 08                	jmp    844 <free+0xd7>
  } else
    p->s.ptr = bp;
 83c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 842:	89 10                	mov    %edx,(%eax)
  freep = p;
 844:	8b 45 fc             	mov    -0x4(%ebp),%eax
 847:	a3 10 0c 00 00       	mov    %eax,0xc10
}
 84c:	c9                   	leave  
 84d:	c3                   	ret    

0000084e <morecore>:

static Header*
morecore(uint nu)
{
 84e:	55                   	push   %ebp
 84f:	89 e5                	mov    %esp,%ebp
 851:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 854:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 85b:	77 07                	ja     864 <morecore+0x16>
    nu = 4096;
 85d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 864:	8b 45 08             	mov    0x8(%ebp),%eax
 867:	c1 e0 03             	shl    $0x3,%eax
 86a:	89 04 24             	mov    %eax,(%esp)
 86d:	e8 40 fc ff ff       	call   4b2 <sbrk>
 872:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 875:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 879:	75 07                	jne    882 <morecore+0x34>
    return 0;
 87b:	b8 00 00 00 00       	mov    $0x0,%eax
 880:	eb 22                	jmp    8a4 <morecore+0x56>
  hp = (Header*)p;
 882:	8b 45 f4             	mov    -0xc(%ebp),%eax
 885:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 888:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88b:	8b 55 08             	mov    0x8(%ebp),%edx
 88e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 891:	8b 45 f0             	mov    -0x10(%ebp),%eax
 894:	83 c0 08             	add    $0x8,%eax
 897:	89 04 24             	mov    %eax,(%esp)
 89a:	e8 ce fe ff ff       	call   76d <free>
  return freep;
 89f:	a1 10 0c 00 00       	mov    0xc10,%eax
}
 8a4:	c9                   	leave  
 8a5:	c3                   	ret    

000008a6 <malloc>:

void*
malloc(uint nbytes)
{
 8a6:	55                   	push   %ebp
 8a7:	89 e5                	mov    %esp,%ebp
 8a9:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8ac:	8b 45 08             	mov    0x8(%ebp),%eax
 8af:	83 c0 07             	add    $0x7,%eax
 8b2:	c1 e8 03             	shr    $0x3,%eax
 8b5:	83 c0 01             	add    $0x1,%eax
 8b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8bb:	a1 10 0c 00 00       	mov    0xc10,%eax
 8c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8c3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8c7:	75 23                	jne    8ec <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8c9:	c7 45 f0 08 0c 00 00 	movl   $0xc08,-0x10(%ebp)
 8d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d3:	a3 10 0c 00 00       	mov    %eax,0xc10
 8d8:	a1 10 0c 00 00       	mov    0xc10,%eax
 8dd:	a3 08 0c 00 00       	mov    %eax,0xc08
    base.s.size = 0;
 8e2:	c7 05 0c 0c 00 00 00 	movl   $0x0,0xc0c
 8e9:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ef:	8b 00                	mov    (%eax),%eax
 8f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f7:	8b 40 04             	mov    0x4(%eax),%eax
 8fa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8fd:	72 4d                	jb     94c <malloc+0xa6>
      if(p->s.size == nunits)
 8ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 902:	8b 40 04             	mov    0x4(%eax),%eax
 905:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 908:	75 0c                	jne    916 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 90a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90d:	8b 10                	mov    (%eax),%edx
 90f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 912:	89 10                	mov    %edx,(%eax)
 914:	eb 26                	jmp    93c <malloc+0x96>
      else {
        p->s.size -= nunits;
 916:	8b 45 f4             	mov    -0xc(%ebp),%eax
 919:	8b 40 04             	mov    0x4(%eax),%eax
 91c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 91f:	89 c2                	mov    %eax,%edx
 921:	8b 45 f4             	mov    -0xc(%ebp),%eax
 924:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 927:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92a:	8b 40 04             	mov    0x4(%eax),%eax
 92d:	c1 e0 03             	shl    $0x3,%eax
 930:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 933:	8b 45 f4             	mov    -0xc(%ebp),%eax
 936:	8b 55 ec             	mov    -0x14(%ebp),%edx
 939:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 93c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93f:	a3 10 0c 00 00       	mov    %eax,0xc10
      return (void*)(p + 1);
 944:	8b 45 f4             	mov    -0xc(%ebp),%eax
 947:	83 c0 08             	add    $0x8,%eax
 94a:	eb 38                	jmp    984 <malloc+0xde>
    }
    if(p == freep)
 94c:	a1 10 0c 00 00       	mov    0xc10,%eax
 951:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 954:	75 1b                	jne    971 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 956:	8b 45 ec             	mov    -0x14(%ebp),%eax
 959:	89 04 24             	mov    %eax,(%esp)
 95c:	e8 ed fe ff ff       	call   84e <morecore>
 961:	89 45 f4             	mov    %eax,-0xc(%ebp)
 964:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 968:	75 07                	jne    971 <malloc+0xcb>
        return 0;
 96a:	b8 00 00 00 00       	mov    $0x0,%eax
 96f:	eb 13                	jmp    984 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 971:	8b 45 f4             	mov    -0xc(%ebp),%eax
 974:	89 45 f0             	mov    %eax,-0x10(%ebp)
 977:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97a:	8b 00                	mov    (%eax),%eax
 97c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 97f:	e9 70 ff ff ff       	jmp    8f4 <malloc+0x4e>
}
 984:	c9                   	leave  
 985:	c3                   	ret    
