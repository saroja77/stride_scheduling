
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  write(fd, s, strlen(s));
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	89 04 24             	mov    %eax,(%esp)
   c:	e8 a7 01 00 00       	call   1b8 <strlen>
  11:	89 44 24 08          	mov    %eax,0x8(%esp)
  15:	8b 45 0c             	mov    0xc(%ebp),%eax
  18:	89 44 24 04          	mov    %eax,0x4(%esp)
  1c:	8b 45 08             	mov    0x8(%ebp),%eax
  1f:	89 04 24             	mov    %eax,(%esp)
  22:	e8 85 03 00 00       	call   3ac <write>
}
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	55                   	push   %ebp
  2a:	89 e5                	mov    %esp,%ebp
  2c:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
  2f:	c7 44 24 04 3c 04 00 	movl   $0x43c,0x4(%esp)
  36:	00 
  37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3e:	e8 bd ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  4a:	eb 2e                	jmp    7a <forktest+0x51>
    pid = fork(0,0);
  4c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  53:	00 
  54:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  5b:	e8 24 03 00 00       	call   384 <fork>
  60:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
  63:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  67:	79 02                	jns    6b <forktest+0x42>
      break;
  69:	eb 18                	jmp    83 <forktest+0x5a>
    if(pid == 0)
  6b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  6f:	75 05                	jne    76 <forktest+0x4d>
      exit();
  71:	e8 16 03 00 00       	call   38c <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  76:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  7a:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  81:	7e c9                	jle    4c <forktest+0x23>
      break;
    if(pid == 0)
      exit();
  }
  
  if(n == N){
  83:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
  8a:	75 21                	jne    ad <forktest+0x84>
    printf(1, "fork claimed to work N times!\n", N);
  8c:	c7 44 24 08 e8 03 00 	movl   $0x3e8,0x8(%esp)
  93:	00 
  94:	c7 44 24 04 48 04 00 	movl   $0x448,0x4(%esp)
  9b:	00 
  9c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a3:	e8 58 ff ff ff       	call   0 <printf>
    exit();
  a8:	e8 df 02 00 00       	call   38c <exit>
  }
  
  for(; n > 0; n--){
  ad:	eb 26                	jmp    d5 <forktest+0xac>
    if(wait() < 0){
  af:	e8 e0 02 00 00       	call   394 <wait>
  b4:	85 c0                	test   %eax,%eax
  b6:	79 19                	jns    d1 <forktest+0xa8>
      printf(1, "wait stopped early\n");
  b8:	c7 44 24 04 67 04 00 	movl   $0x467,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 34 ff ff ff       	call   0 <printf>
      exit();
  cc:	e8 bb 02 00 00       	call   38c <exit>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
  d1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  d9:	7f d4                	jg     af <forktest+0x86>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
  db:	e8 b4 02 00 00       	call   394 <wait>
  e0:	83 f8 ff             	cmp    $0xffffffff,%eax
  e3:	74 19                	je     fe <forktest+0xd5>
    printf(1, "wait got too many\n");
  e5:	c7 44 24 04 7b 04 00 	movl   $0x47b,0x4(%esp)
  ec:	00 
  ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f4:	e8 07 ff ff ff       	call   0 <printf>
    exit();
  f9:	e8 8e 02 00 00       	call   38c <exit>
  }
  
  printf(1, "fork test OK\n");
  fe:	c7 44 24 04 8e 04 00 	movl   $0x48e,0x4(%esp)
 105:	00 
 106:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 10d:	e8 ee fe ff ff       	call   0 <printf>
}
 112:	c9                   	leave  
 113:	c3                   	ret    

00000114 <main>:

int
main(void)
{
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
 11a:	e8 0a ff ff ff       	call   29 <forktest>
  exit();
 11f:	e8 68 02 00 00       	call   38c <exit>

00000124 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 129:	8b 4d 08             	mov    0x8(%ebp),%ecx
 12c:	8b 55 10             	mov    0x10(%ebp),%edx
 12f:	8b 45 0c             	mov    0xc(%ebp),%eax
 132:	89 cb                	mov    %ecx,%ebx
 134:	89 df                	mov    %ebx,%edi
 136:	89 d1                	mov    %edx,%ecx
 138:	fc                   	cld    
 139:	f3 aa                	rep stos %al,%es:(%edi)
 13b:	89 ca                	mov    %ecx,%edx
 13d:	89 fb                	mov    %edi,%ebx
 13f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 142:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 145:	5b                   	pop    %ebx
 146:	5f                   	pop    %edi
 147:	5d                   	pop    %ebp
 148:	c3                   	ret    

00000149 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 149:	55                   	push   %ebp
 14a:	89 e5                	mov    %esp,%ebp
 14c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 155:	90                   	nop
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	8d 50 01             	lea    0x1(%eax),%edx
 15c:	89 55 08             	mov    %edx,0x8(%ebp)
 15f:	8b 55 0c             	mov    0xc(%ebp),%edx
 162:	8d 4a 01             	lea    0x1(%edx),%ecx
 165:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 168:	0f b6 12             	movzbl (%edx),%edx
 16b:	88 10                	mov    %dl,(%eax)
 16d:	0f b6 00             	movzbl (%eax),%eax
 170:	84 c0                	test   %al,%al
 172:	75 e2                	jne    156 <strcpy+0xd>
    ;
  return os;
 174:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 177:	c9                   	leave  
 178:	c3                   	ret    

00000179 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 17c:	eb 08                	jmp    186 <strcmp+0xd>
    p++, q++;
 17e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 182:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 186:	8b 45 08             	mov    0x8(%ebp),%eax
 189:	0f b6 00             	movzbl (%eax),%eax
 18c:	84 c0                	test   %al,%al
 18e:	74 10                	je     1a0 <strcmp+0x27>
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 10             	movzbl (%eax),%edx
 196:	8b 45 0c             	mov    0xc(%ebp),%eax
 199:	0f b6 00             	movzbl (%eax),%eax
 19c:	38 c2                	cmp    %al,%dl
 19e:	74 de                	je     17e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1a0:	8b 45 08             	mov    0x8(%ebp),%eax
 1a3:	0f b6 00             	movzbl (%eax),%eax
 1a6:	0f b6 d0             	movzbl %al,%edx
 1a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ac:	0f b6 00             	movzbl (%eax),%eax
 1af:	0f b6 c0             	movzbl %al,%eax
 1b2:	29 c2                	sub    %eax,%edx
 1b4:	89 d0                	mov    %edx,%eax
}
 1b6:	5d                   	pop    %ebp
 1b7:	c3                   	ret    

000001b8 <strlen>:

uint
strlen(char *s)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1c5:	eb 04                	jmp    1cb <strlen+0x13>
 1c7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ce:	8b 45 08             	mov    0x8(%ebp),%eax
 1d1:	01 d0                	add    %edx,%eax
 1d3:	0f b6 00             	movzbl (%eax),%eax
 1d6:	84 c0                	test   %al,%al
 1d8:	75 ed                	jne    1c7 <strlen+0xf>
    ;
  return n;
 1da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1dd:	c9                   	leave  
 1de:	c3                   	ret    

000001df <memset>:

void*
memset(void *dst, int c, uint n)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1e5:	8b 45 10             	mov    0x10(%ebp),%eax
 1e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 1ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 26 ff ff ff       	call   124 <stosb>
  return dst;
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
}
 201:	c9                   	leave  
 202:	c3                   	ret    

00000203 <strchr>:

char*
strchr(const char *s, char c)
{
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	83 ec 04             	sub    $0x4,%esp
 209:	8b 45 0c             	mov    0xc(%ebp),%eax
 20c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 20f:	eb 14                	jmp    225 <strchr+0x22>
    if(*s == c)
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	0f b6 00             	movzbl (%eax),%eax
 217:	3a 45 fc             	cmp    -0x4(%ebp),%al
 21a:	75 05                	jne    221 <strchr+0x1e>
      return (char*)s;
 21c:	8b 45 08             	mov    0x8(%ebp),%eax
 21f:	eb 13                	jmp    234 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 221:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	84 c0                	test   %al,%al
 22d:	75 e2                	jne    211 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 22f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 234:	c9                   	leave  
 235:	c3                   	ret    

00000236 <gets>:

char*
gets(char *buf, int max)
{
 236:	55                   	push   %ebp
 237:	89 e5                	mov    %esp,%ebp
 239:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 23c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 243:	eb 4c                	jmp    291 <gets+0x5b>
    cc = read(0, &c, 1);
 245:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 24c:	00 
 24d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 250:	89 44 24 04          	mov    %eax,0x4(%esp)
 254:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 25b:	e8 44 01 00 00       	call   3a4 <read>
 260:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 263:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 267:	7f 02                	jg     26b <gets+0x35>
      break;
 269:	eb 31                	jmp    29c <gets+0x66>
    buf[i++] = c;
 26b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26e:	8d 50 01             	lea    0x1(%eax),%edx
 271:	89 55 f4             	mov    %edx,-0xc(%ebp)
 274:	89 c2                	mov    %eax,%edx
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	01 c2                	add    %eax,%edx
 27b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 281:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 285:	3c 0a                	cmp    $0xa,%al
 287:	74 13                	je     29c <gets+0x66>
 289:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 28d:	3c 0d                	cmp    $0xd,%al
 28f:	74 0b                	je     29c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 291:	8b 45 f4             	mov    -0xc(%ebp),%eax
 294:	83 c0 01             	add    $0x1,%eax
 297:	3b 45 0c             	cmp    0xc(%ebp),%eax
 29a:	7c a9                	jl     245 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 29c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 29f:	8b 45 08             	mov    0x8(%ebp),%eax
 2a2:	01 d0                	add    %edx,%eax
 2a4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2aa:	c9                   	leave  
 2ab:	c3                   	ret    

000002ac <stat>:

int
stat(char *n, struct stat *st)
{
 2ac:	55                   	push   %ebp
 2ad:	89 e5                	mov    %esp,%ebp
 2af:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b9:	00 
 2ba:	8b 45 08             	mov    0x8(%ebp),%eax
 2bd:	89 04 24             	mov    %eax,(%esp)
 2c0:	e8 07 01 00 00       	call   3cc <open>
 2c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2cc:	79 07                	jns    2d5 <stat+0x29>
    return -1;
 2ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d3:	eb 23                	jmp    2f8 <stat+0x4c>
  r = fstat(fd, st);
 2d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2df:	89 04 24             	mov    %eax,(%esp)
 2e2:	e8 fd 00 00 00       	call   3e4 <fstat>
 2e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ed:	89 04 24             	mov    %eax,(%esp)
 2f0:	e8 bf 00 00 00       	call   3b4 <close>
  return r;
 2f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2f8:	c9                   	leave  
 2f9:	c3                   	ret    

000002fa <atoi>:

int
atoi(const char *s)
{
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 300:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 307:	eb 25                	jmp    32e <atoi+0x34>
    n = n*10 + *s++ - '0';
 309:	8b 55 fc             	mov    -0x4(%ebp),%edx
 30c:	89 d0                	mov    %edx,%eax
 30e:	c1 e0 02             	shl    $0x2,%eax
 311:	01 d0                	add    %edx,%eax
 313:	01 c0                	add    %eax,%eax
 315:	89 c1                	mov    %eax,%ecx
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	8d 50 01             	lea    0x1(%eax),%edx
 31d:	89 55 08             	mov    %edx,0x8(%ebp)
 320:	0f b6 00             	movzbl (%eax),%eax
 323:	0f be c0             	movsbl %al,%eax
 326:	01 c8                	add    %ecx,%eax
 328:	83 e8 30             	sub    $0x30,%eax
 32b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	0f b6 00             	movzbl (%eax),%eax
 334:	3c 2f                	cmp    $0x2f,%al
 336:	7e 0a                	jle    342 <atoi+0x48>
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	0f b6 00             	movzbl (%eax),%eax
 33e:	3c 39                	cmp    $0x39,%al
 340:	7e c7                	jle    309 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 342:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 345:	c9                   	leave  
 346:	c3                   	ret    

00000347 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
 34a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 353:	8b 45 0c             	mov    0xc(%ebp),%eax
 356:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 359:	eb 17                	jmp    372 <memmove+0x2b>
    *dst++ = *src++;
 35b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 35e:	8d 50 01             	lea    0x1(%eax),%edx
 361:	89 55 fc             	mov    %edx,-0x4(%ebp)
 364:	8b 55 f8             	mov    -0x8(%ebp),%edx
 367:	8d 4a 01             	lea    0x1(%edx),%ecx
 36a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 36d:	0f b6 12             	movzbl (%edx),%edx
 370:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 372:	8b 45 10             	mov    0x10(%ebp),%eax
 375:	8d 50 ff             	lea    -0x1(%eax),%edx
 378:	89 55 10             	mov    %edx,0x10(%ebp)
 37b:	85 c0                	test   %eax,%eax
 37d:	7f dc                	jg     35b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 382:	c9                   	leave  
 383:	c3                   	ret    

00000384 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 384:	b8 01 00 00 00       	mov    $0x1,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <exit>:
SYSCALL(exit)
 38c:	b8 02 00 00 00       	mov    $0x2,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <wait>:
SYSCALL(wait)
 394:	b8 03 00 00 00       	mov    $0x3,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <pipe>:
SYSCALL(pipe)
 39c:	b8 04 00 00 00       	mov    $0x4,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <read>:
SYSCALL(read)
 3a4:	b8 05 00 00 00       	mov    $0x5,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <write>:
SYSCALL(write)
 3ac:	b8 10 00 00 00       	mov    $0x10,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <close>:
SYSCALL(close)
 3b4:	b8 15 00 00 00       	mov    $0x15,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <kill>:
SYSCALL(kill)
 3bc:	b8 06 00 00 00       	mov    $0x6,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <exec>:
SYSCALL(exec)
 3c4:	b8 07 00 00 00       	mov    $0x7,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <open>:
SYSCALL(open)
 3cc:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <mknod>:
SYSCALL(mknod)
 3d4:	b8 11 00 00 00       	mov    $0x11,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <unlink>:
SYSCALL(unlink)
 3dc:	b8 12 00 00 00       	mov    $0x12,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <fstat>:
SYSCALL(fstat)
 3e4:	b8 08 00 00 00       	mov    $0x8,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <link>:
SYSCALL(link)
 3ec:	b8 13 00 00 00       	mov    $0x13,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <mkdir>:
SYSCALL(mkdir)
 3f4:	b8 14 00 00 00       	mov    $0x14,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <chdir>:
SYSCALL(chdir)
 3fc:	b8 09 00 00 00       	mov    $0x9,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <dup>:
SYSCALL(dup)
 404:	b8 0a 00 00 00       	mov    $0xa,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <getpid>:
SYSCALL(getpid)
 40c:	b8 0b 00 00 00       	mov    $0xb,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <sbrk>:
SYSCALL(sbrk)
 414:	b8 0c 00 00 00       	mov    $0xc,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <sleep>:
SYSCALL(sleep)
 41c:	b8 0d 00 00 00       	mov    $0xd,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <uptime>:
SYSCALL(uptime)
 424:	b8 0e 00 00 00       	mov    $0xe,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <hello>:
SYSCALL(hello)
 42c:	b8 16 00 00 00       	mov    $0x16,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <cps>:
SYSCALL(cps)
 434:	b8 17 00 00 00       	mov    $0x17,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    
