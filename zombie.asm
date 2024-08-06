
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork(0,0) > 0)
   9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10:	00 
  11:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  18:	e8 75 02 00 00       	call   292 <fork>
  1d:	85 c0                	test   %eax,%eax
  1f:	7e 0c                	jle    2d <main+0x2d>
    sleep(5);  // Let child exit before parent.
  21:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  28:	e8 fd 02 00 00       	call   32a <sleep>
  exit();
  2d:	e8 68 02 00 00       	call   29a <exit>

00000032 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  32:	55                   	push   %ebp
  33:	89 e5                	mov    %esp,%ebp
  35:	57                   	push   %edi
  36:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  37:	8b 4d 08             	mov    0x8(%ebp),%ecx
  3a:	8b 55 10             	mov    0x10(%ebp),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	89 cb                	mov    %ecx,%ebx
  42:	89 df                	mov    %ebx,%edi
  44:	89 d1                	mov    %edx,%ecx
  46:	fc                   	cld    
  47:	f3 aa                	rep stos %al,%es:(%edi)
  49:	89 ca                	mov    %ecx,%edx
  4b:	89 fb                	mov    %edi,%ebx
  4d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  50:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  53:	5b                   	pop    %ebx
  54:	5f                   	pop    %edi
  55:	5d                   	pop    %ebp
  56:	c3                   	ret    

00000057 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  57:	55                   	push   %ebp
  58:	89 e5                	mov    %esp,%ebp
  5a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  5d:	8b 45 08             	mov    0x8(%ebp),%eax
  60:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  63:	90                   	nop
  64:	8b 45 08             	mov    0x8(%ebp),%eax
  67:	8d 50 01             	lea    0x1(%eax),%edx
  6a:	89 55 08             	mov    %edx,0x8(%ebp)
  6d:	8b 55 0c             	mov    0xc(%ebp),%edx
  70:	8d 4a 01             	lea    0x1(%edx),%ecx
  73:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  76:	0f b6 12             	movzbl (%edx),%edx
  79:	88 10                	mov    %dl,(%eax)
  7b:	0f b6 00             	movzbl (%eax),%eax
  7e:	84 c0                	test   %al,%al
  80:	75 e2                	jne    64 <strcpy+0xd>
    ;
  return os;
  82:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  85:	c9                   	leave  
  86:	c3                   	ret    

00000087 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  8a:	eb 08                	jmp    94 <strcmp+0xd>
    p++, q++;
  8c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  90:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  94:	8b 45 08             	mov    0x8(%ebp),%eax
  97:	0f b6 00             	movzbl (%eax),%eax
  9a:	84 c0                	test   %al,%al
  9c:	74 10                	je     ae <strcmp+0x27>
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	0f b6 10             	movzbl (%eax),%edx
  a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  a7:	0f b6 00             	movzbl (%eax),%eax
  aa:	38 c2                	cmp    %al,%dl
  ac:	74 de                	je     8c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ae:	8b 45 08             	mov    0x8(%ebp),%eax
  b1:	0f b6 00             	movzbl (%eax),%eax
  b4:	0f b6 d0             	movzbl %al,%edx
  b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ba:	0f b6 00             	movzbl (%eax),%eax
  bd:	0f b6 c0             	movzbl %al,%eax
  c0:	29 c2                	sub    %eax,%edx
  c2:	89 d0                	mov    %edx,%eax
}
  c4:	5d                   	pop    %ebp
  c5:	c3                   	ret    

000000c6 <strlen>:

uint
strlen(char *s)
{
  c6:	55                   	push   %ebp
  c7:	89 e5                	mov    %esp,%ebp
  c9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  d3:	eb 04                	jmp    d9 <strlen+0x13>
  d5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  dc:	8b 45 08             	mov    0x8(%ebp),%eax
  df:	01 d0                	add    %edx,%eax
  e1:	0f b6 00             	movzbl (%eax),%eax
  e4:	84 c0                	test   %al,%al
  e6:	75 ed                	jne    d5 <strlen+0xf>
    ;
  return n;
  e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  eb:	c9                   	leave  
  ec:	c3                   	ret    

000000ed <memset>:

void*
memset(void *dst, int c, uint n)
{
  ed:	55                   	push   %ebp
  ee:	89 e5                	mov    %esp,%ebp
  f0:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  f3:	8b 45 10             	mov    0x10(%ebp),%eax
  f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 101:	8b 45 08             	mov    0x8(%ebp),%eax
 104:	89 04 24             	mov    %eax,(%esp)
 107:	e8 26 ff ff ff       	call   32 <stosb>
  return dst;
 10c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 10f:	c9                   	leave  
 110:	c3                   	ret    

00000111 <strchr>:

char*
strchr(const char *s, char c)
{
 111:	55                   	push   %ebp
 112:	89 e5                	mov    %esp,%ebp
 114:	83 ec 04             	sub    $0x4,%esp
 117:	8b 45 0c             	mov    0xc(%ebp),%eax
 11a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 11d:	eb 14                	jmp    133 <strchr+0x22>
    if(*s == c)
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	0f b6 00             	movzbl (%eax),%eax
 125:	3a 45 fc             	cmp    -0x4(%ebp),%al
 128:	75 05                	jne    12f <strchr+0x1e>
      return (char*)s;
 12a:	8b 45 08             	mov    0x8(%ebp),%eax
 12d:	eb 13                	jmp    142 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 12f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 00             	movzbl (%eax),%eax
 139:	84 c0                	test   %al,%al
 13b:	75 e2                	jne    11f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 13d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 142:	c9                   	leave  
 143:	c3                   	ret    

00000144 <gets>:

char*
gets(char *buf, int max)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 14a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 151:	eb 4c                	jmp    19f <gets+0x5b>
    cc = read(0, &c, 1);
 153:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 15a:	00 
 15b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 15e:	89 44 24 04          	mov    %eax,0x4(%esp)
 162:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 169:	e8 44 01 00 00       	call   2b2 <read>
 16e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 171:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 175:	7f 02                	jg     179 <gets+0x35>
      break;
 177:	eb 31                	jmp    1aa <gets+0x66>
    buf[i++] = c;
 179:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17c:	8d 50 01             	lea    0x1(%eax),%edx
 17f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 182:	89 c2                	mov    %eax,%edx
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	01 c2                	add    %eax,%edx
 189:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 18f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 193:	3c 0a                	cmp    $0xa,%al
 195:	74 13                	je     1aa <gets+0x66>
 197:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 19b:	3c 0d                	cmp    $0xd,%al
 19d:	74 0b                	je     1aa <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a2:	83 c0 01             	add    $0x1,%eax
 1a5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1a8:	7c a9                	jl     153 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1ad:	8b 45 08             	mov    0x8(%ebp),%eax
 1b0:	01 d0                	add    %edx,%eax
 1b2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1b5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1b8:	c9                   	leave  
 1b9:	c3                   	ret    

000001ba <stat>:

int
stat(char *n, struct stat *st)
{
 1ba:	55                   	push   %ebp
 1bb:	89 e5                	mov    %esp,%ebp
 1bd:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1c7:	00 
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
 1cb:	89 04 24             	mov    %eax,(%esp)
 1ce:	e8 07 01 00 00       	call   2da <open>
 1d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1da:	79 07                	jns    1e3 <stat+0x29>
    return -1;
 1dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1e1:	eb 23                	jmp    206 <stat+0x4c>
  r = fstat(fd, st);
 1e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ed:	89 04 24             	mov    %eax,(%esp)
 1f0:	e8 fd 00 00 00       	call   2f2 <fstat>
 1f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1fb:	89 04 24             	mov    %eax,(%esp)
 1fe:	e8 bf 00 00 00       	call   2c2 <close>
  return r;
 203:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <atoi>:

int
atoi(const char *s)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 20e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 215:	eb 25                	jmp    23c <atoi+0x34>
    n = n*10 + *s++ - '0';
 217:	8b 55 fc             	mov    -0x4(%ebp),%edx
 21a:	89 d0                	mov    %edx,%eax
 21c:	c1 e0 02             	shl    $0x2,%eax
 21f:	01 d0                	add    %edx,%eax
 221:	01 c0                	add    %eax,%eax
 223:	89 c1                	mov    %eax,%ecx
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	8d 50 01             	lea    0x1(%eax),%edx
 22b:	89 55 08             	mov    %edx,0x8(%ebp)
 22e:	0f b6 00             	movzbl (%eax),%eax
 231:	0f be c0             	movsbl %al,%eax
 234:	01 c8                	add    %ecx,%eax
 236:	83 e8 30             	sub    $0x30,%eax
 239:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	3c 2f                	cmp    $0x2f,%al
 244:	7e 0a                	jle    250 <atoi+0x48>
 246:	8b 45 08             	mov    0x8(%ebp),%eax
 249:	0f b6 00             	movzbl (%eax),%eax
 24c:	3c 39                	cmp    $0x39,%al
 24e:	7e c7                	jle    217 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 250:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 253:	c9                   	leave  
 254:	c3                   	ret    

00000255 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 25b:	8b 45 08             	mov    0x8(%ebp),%eax
 25e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 261:	8b 45 0c             	mov    0xc(%ebp),%eax
 264:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 267:	eb 17                	jmp    280 <memmove+0x2b>
    *dst++ = *src++;
 269:	8b 45 fc             	mov    -0x4(%ebp),%eax
 26c:	8d 50 01             	lea    0x1(%eax),%edx
 26f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 272:	8b 55 f8             	mov    -0x8(%ebp),%edx
 275:	8d 4a 01             	lea    0x1(%edx),%ecx
 278:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 27b:	0f b6 12             	movzbl (%edx),%edx
 27e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 280:	8b 45 10             	mov    0x10(%ebp),%eax
 283:	8d 50 ff             	lea    -0x1(%eax),%edx
 286:	89 55 10             	mov    %edx,0x10(%ebp)
 289:	85 c0                	test   %eax,%eax
 28b:	7f dc                	jg     269 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 290:	c9                   	leave  
 291:	c3                   	ret    

00000292 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 292:	b8 01 00 00 00       	mov    $0x1,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <exit>:
SYSCALL(exit)
 29a:	b8 02 00 00 00       	mov    $0x2,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <wait>:
SYSCALL(wait)
 2a2:	b8 03 00 00 00       	mov    $0x3,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <pipe>:
SYSCALL(pipe)
 2aa:	b8 04 00 00 00       	mov    $0x4,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <read>:
SYSCALL(read)
 2b2:	b8 05 00 00 00       	mov    $0x5,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <write>:
SYSCALL(write)
 2ba:	b8 10 00 00 00       	mov    $0x10,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <close>:
SYSCALL(close)
 2c2:	b8 15 00 00 00       	mov    $0x15,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <kill>:
SYSCALL(kill)
 2ca:	b8 06 00 00 00       	mov    $0x6,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <exec>:
SYSCALL(exec)
 2d2:	b8 07 00 00 00       	mov    $0x7,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <open>:
SYSCALL(open)
 2da:	b8 0f 00 00 00       	mov    $0xf,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <mknod>:
SYSCALL(mknod)
 2e2:	b8 11 00 00 00       	mov    $0x11,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <unlink>:
SYSCALL(unlink)
 2ea:	b8 12 00 00 00       	mov    $0x12,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <fstat>:
SYSCALL(fstat)
 2f2:	b8 08 00 00 00       	mov    $0x8,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <link>:
SYSCALL(link)
 2fa:	b8 13 00 00 00       	mov    $0x13,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <mkdir>:
SYSCALL(mkdir)
 302:	b8 14 00 00 00       	mov    $0x14,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <chdir>:
SYSCALL(chdir)
 30a:	b8 09 00 00 00       	mov    $0x9,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <dup>:
SYSCALL(dup)
 312:	b8 0a 00 00 00       	mov    $0xa,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <getpid>:
SYSCALL(getpid)
 31a:	b8 0b 00 00 00       	mov    $0xb,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <sbrk>:
SYSCALL(sbrk)
 322:	b8 0c 00 00 00       	mov    $0xc,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <sleep>:
SYSCALL(sleep)
 32a:	b8 0d 00 00 00       	mov    $0xd,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <uptime>:
SYSCALL(uptime)
 332:	b8 0e 00 00 00       	mov    $0xe,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <hello>:
SYSCALL(hello)
 33a:	b8 16 00 00 00       	mov    $0x16,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <cps>:
SYSCALL(cps)
 342:	b8 17 00 00 00       	mov    $0x17,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	83 ec 18             	sub    $0x18,%esp
 350:	8b 45 0c             	mov    0xc(%ebp),%eax
 353:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 356:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 35d:	00 
 35e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 361:	89 44 24 04          	mov    %eax,0x4(%esp)
 365:	8b 45 08             	mov    0x8(%ebp),%eax
 368:	89 04 24             	mov    %eax,(%esp)
 36b:	e8 4a ff ff ff       	call   2ba <write>
}
 370:	c9                   	leave  
 371:	c3                   	ret    

00000372 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 372:	55                   	push   %ebp
 373:	89 e5                	mov    %esp,%ebp
 375:	56                   	push   %esi
 376:	53                   	push   %ebx
 377:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 37a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 381:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 385:	74 17                	je     39e <printint+0x2c>
 387:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 38b:	79 11                	jns    39e <printint+0x2c>
    neg = 1;
 38d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 394:	8b 45 0c             	mov    0xc(%ebp),%eax
 397:	f7 d8                	neg    %eax
 399:	89 45 ec             	mov    %eax,-0x14(%ebp)
 39c:	eb 06                	jmp    3a4 <printint+0x32>
  } else {
    x = xx;
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3ab:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3ae:	8d 41 01             	lea    0x1(%ecx),%eax
 3b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3b4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ba:	ba 00 00 00 00       	mov    $0x0,%edx
 3bf:	f7 f3                	div    %ebx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	0f b6 80 44 0a 00 00 	movzbl 0xa44(%eax),%eax
 3ca:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3ce:	8b 75 10             	mov    0x10(%ebp),%esi
 3d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3d4:	ba 00 00 00 00       	mov    $0x0,%edx
 3d9:	f7 f6                	div    %esi
 3db:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3e2:	75 c7                	jne    3ab <printint+0x39>
  if(neg)
 3e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3e8:	74 10                	je     3fa <printint+0x88>
    buf[i++] = '-';
 3ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ed:	8d 50 01             	lea    0x1(%eax),%edx
 3f0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3f8:	eb 1f                	jmp    419 <printint+0xa7>
 3fa:	eb 1d                	jmp    419 <printint+0xa7>
    putc(fd, buf[i]);
 3fc:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 402:	01 d0                	add    %edx,%eax
 404:	0f b6 00             	movzbl (%eax),%eax
 407:	0f be c0             	movsbl %al,%eax
 40a:	89 44 24 04          	mov    %eax,0x4(%esp)
 40e:	8b 45 08             	mov    0x8(%ebp),%eax
 411:	89 04 24             	mov    %eax,(%esp)
 414:	e8 31 ff ff ff       	call   34a <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 419:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 41d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 421:	79 d9                	jns    3fc <printint+0x8a>
    putc(fd, buf[i]);
}
 423:	83 c4 30             	add    $0x30,%esp
 426:	5b                   	pop    %ebx
 427:	5e                   	pop    %esi
 428:	5d                   	pop    %ebp
 429:	c3                   	ret    

0000042a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 42a:	55                   	push   %ebp
 42b:	89 e5                	mov    %esp,%ebp
 42d:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 430:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 437:	8d 45 0c             	lea    0xc(%ebp),%eax
 43a:	83 c0 04             	add    $0x4,%eax
 43d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 440:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 447:	e9 7c 01 00 00       	jmp    5c8 <printf+0x19e>
    c = fmt[i] & 0xff;
 44c:	8b 55 0c             	mov    0xc(%ebp),%edx
 44f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 452:	01 d0                	add    %edx,%eax
 454:	0f b6 00             	movzbl (%eax),%eax
 457:	0f be c0             	movsbl %al,%eax
 45a:	25 ff 00 00 00       	and    $0xff,%eax
 45f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 462:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 466:	75 2c                	jne    494 <printf+0x6a>
      if(c == '%'){
 468:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 46c:	75 0c                	jne    47a <printf+0x50>
        state = '%';
 46e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 475:	e9 4a 01 00 00       	jmp    5c4 <printf+0x19a>
      } else {
        putc(fd, c);
 47a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 47d:	0f be c0             	movsbl %al,%eax
 480:	89 44 24 04          	mov    %eax,0x4(%esp)
 484:	8b 45 08             	mov    0x8(%ebp),%eax
 487:	89 04 24             	mov    %eax,(%esp)
 48a:	e8 bb fe ff ff       	call   34a <putc>
 48f:	e9 30 01 00 00       	jmp    5c4 <printf+0x19a>
      }
    } else if(state == '%'){
 494:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 498:	0f 85 26 01 00 00    	jne    5c4 <printf+0x19a>
      if(c == 'd'){
 49e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4a2:	75 2d                	jne    4d1 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4a7:	8b 00                	mov    (%eax),%eax
 4a9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4b0:	00 
 4b1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4b8:	00 
 4b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4bd:	8b 45 08             	mov    0x8(%ebp),%eax
 4c0:	89 04 24             	mov    %eax,(%esp)
 4c3:	e8 aa fe ff ff       	call   372 <printint>
        ap++;
 4c8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4cc:	e9 ec 00 00 00       	jmp    5bd <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4d1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4d5:	74 06                	je     4dd <printf+0xb3>
 4d7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4db:	75 2d                	jne    50a <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e0:	8b 00                	mov    (%eax),%eax
 4e2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4e9:	00 
 4ea:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4f1:	00 
 4f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	89 04 24             	mov    %eax,(%esp)
 4fc:	e8 71 fe ff ff       	call   372 <printint>
        ap++;
 501:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 505:	e9 b3 00 00 00       	jmp    5bd <printf+0x193>
      } else if(c == 's'){
 50a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 50e:	75 45                	jne    555 <printf+0x12b>
        s = (char*)*ap;
 510:	8b 45 e8             	mov    -0x18(%ebp),%eax
 513:	8b 00                	mov    (%eax),%eax
 515:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 518:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 51c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 520:	75 09                	jne    52b <printf+0x101>
          s = "(null)";
 522:	c7 45 f4 f6 07 00 00 	movl   $0x7f6,-0xc(%ebp)
        while(*s != 0){
 529:	eb 1e                	jmp    549 <printf+0x11f>
 52b:	eb 1c                	jmp    549 <printf+0x11f>
          putc(fd, *s);
 52d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 530:	0f b6 00             	movzbl (%eax),%eax
 533:	0f be c0             	movsbl %al,%eax
 536:	89 44 24 04          	mov    %eax,0x4(%esp)
 53a:	8b 45 08             	mov    0x8(%ebp),%eax
 53d:	89 04 24             	mov    %eax,(%esp)
 540:	e8 05 fe ff ff       	call   34a <putc>
          s++;
 545:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 549:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54c:	0f b6 00             	movzbl (%eax),%eax
 54f:	84 c0                	test   %al,%al
 551:	75 da                	jne    52d <printf+0x103>
 553:	eb 68                	jmp    5bd <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 555:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 559:	75 1d                	jne    578 <printf+0x14e>
        putc(fd, *ap);
 55b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 55e:	8b 00                	mov    (%eax),%eax
 560:	0f be c0             	movsbl %al,%eax
 563:	89 44 24 04          	mov    %eax,0x4(%esp)
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	89 04 24             	mov    %eax,(%esp)
 56d:	e8 d8 fd ff ff       	call   34a <putc>
        ap++;
 572:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 576:	eb 45                	jmp    5bd <printf+0x193>
      } else if(c == '%'){
 578:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 57c:	75 17                	jne    595 <printf+0x16b>
        putc(fd, c);
 57e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 581:	0f be c0             	movsbl %al,%eax
 584:	89 44 24 04          	mov    %eax,0x4(%esp)
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	89 04 24             	mov    %eax,(%esp)
 58e:	e8 b7 fd ff ff       	call   34a <putc>
 593:	eb 28                	jmp    5bd <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 595:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 59c:	00 
 59d:	8b 45 08             	mov    0x8(%ebp),%eax
 5a0:	89 04 24             	mov    %eax,(%esp)
 5a3:	e8 a2 fd ff ff       	call   34a <putc>
        putc(fd, c);
 5a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ab:	0f be c0             	movsbl %al,%eax
 5ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	89 04 24             	mov    %eax,(%esp)
 5b8:	e8 8d fd ff ff       	call   34a <putc>
      }
      state = 0;
 5bd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5c8:	8b 55 0c             	mov    0xc(%ebp),%edx
 5cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ce:	01 d0                	add    %edx,%eax
 5d0:	0f b6 00             	movzbl (%eax),%eax
 5d3:	84 c0                	test   %al,%al
 5d5:	0f 85 71 fe ff ff    	jne    44c <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5db:	c9                   	leave  
 5dc:	c3                   	ret    

000005dd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5dd:	55                   	push   %ebp
 5de:	89 e5                	mov    %esp,%ebp
 5e0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	83 e8 08             	sub    $0x8,%eax
 5e9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ec:	a1 60 0a 00 00       	mov    0xa60,%eax
 5f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5f4:	eb 24                	jmp    61a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f9:	8b 00                	mov    (%eax),%eax
 5fb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5fe:	77 12                	ja     612 <free+0x35>
 600:	8b 45 f8             	mov    -0x8(%ebp),%eax
 603:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 606:	77 24                	ja     62c <free+0x4f>
 608:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60b:	8b 00                	mov    (%eax),%eax
 60d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 610:	77 1a                	ja     62c <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 612:	8b 45 fc             	mov    -0x4(%ebp),%eax
 615:	8b 00                	mov    (%eax),%eax
 617:	89 45 fc             	mov    %eax,-0x4(%ebp)
 61a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 620:	76 d4                	jbe    5f6 <free+0x19>
 622:	8b 45 fc             	mov    -0x4(%ebp),%eax
 625:	8b 00                	mov    (%eax),%eax
 627:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 62a:	76 ca                	jbe    5f6 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 62c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62f:	8b 40 04             	mov    0x4(%eax),%eax
 632:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 639:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63c:	01 c2                	add    %eax,%edx
 63e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 641:	8b 00                	mov    (%eax),%eax
 643:	39 c2                	cmp    %eax,%edx
 645:	75 24                	jne    66b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 647:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64a:	8b 50 04             	mov    0x4(%eax),%edx
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	8b 00                	mov    (%eax),%eax
 652:	8b 40 04             	mov    0x4(%eax),%eax
 655:	01 c2                	add    %eax,%edx
 657:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	8b 10                	mov    (%eax),%edx
 664:	8b 45 f8             	mov    -0x8(%ebp),%eax
 667:	89 10                	mov    %edx,(%eax)
 669:	eb 0a                	jmp    675 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 66b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66e:	8b 10                	mov    (%eax),%edx
 670:	8b 45 f8             	mov    -0x8(%ebp),%eax
 673:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 675:	8b 45 fc             	mov    -0x4(%ebp),%eax
 678:	8b 40 04             	mov    0x4(%eax),%eax
 67b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 682:	8b 45 fc             	mov    -0x4(%ebp),%eax
 685:	01 d0                	add    %edx,%eax
 687:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 68a:	75 20                	jne    6ac <free+0xcf>
    p->s.size += bp->s.size;
 68c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68f:	8b 50 04             	mov    0x4(%eax),%edx
 692:	8b 45 f8             	mov    -0x8(%ebp),%eax
 695:	8b 40 04             	mov    0x4(%eax),%eax
 698:	01 c2                	add    %eax,%edx
 69a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a3:	8b 10                	mov    (%eax),%edx
 6a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a8:	89 10                	mov    %edx,(%eax)
 6aa:	eb 08                	jmp    6b4 <free+0xd7>
  } else
    p->s.ptr = bp;
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6b2:	89 10                	mov    %edx,(%eax)
  freep = p;
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	a3 60 0a 00 00       	mov    %eax,0xa60
}
 6bc:	c9                   	leave  
 6bd:	c3                   	ret    

000006be <morecore>:

static Header*
morecore(uint nu)
{
 6be:	55                   	push   %ebp
 6bf:	89 e5                	mov    %esp,%ebp
 6c1:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6c4:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6cb:	77 07                	ja     6d4 <morecore+0x16>
    nu = 4096;
 6cd:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6d4:	8b 45 08             	mov    0x8(%ebp),%eax
 6d7:	c1 e0 03             	shl    $0x3,%eax
 6da:	89 04 24             	mov    %eax,(%esp)
 6dd:	e8 40 fc ff ff       	call   322 <sbrk>
 6e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6e5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6e9:	75 07                	jne    6f2 <morecore+0x34>
    return 0;
 6eb:	b8 00 00 00 00       	mov    $0x0,%eax
 6f0:	eb 22                	jmp    714 <morecore+0x56>
  hp = (Header*)p;
 6f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fb:	8b 55 08             	mov    0x8(%ebp),%edx
 6fe:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 701:	8b 45 f0             	mov    -0x10(%ebp),%eax
 704:	83 c0 08             	add    $0x8,%eax
 707:	89 04 24             	mov    %eax,(%esp)
 70a:	e8 ce fe ff ff       	call   5dd <free>
  return freep;
 70f:	a1 60 0a 00 00       	mov    0xa60,%eax
}
 714:	c9                   	leave  
 715:	c3                   	ret    

00000716 <malloc>:

void*
malloc(uint nbytes)
{
 716:	55                   	push   %ebp
 717:	89 e5                	mov    %esp,%ebp
 719:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	83 c0 07             	add    $0x7,%eax
 722:	c1 e8 03             	shr    $0x3,%eax
 725:	83 c0 01             	add    $0x1,%eax
 728:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 72b:	a1 60 0a 00 00       	mov    0xa60,%eax
 730:	89 45 f0             	mov    %eax,-0x10(%ebp)
 733:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 737:	75 23                	jne    75c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 739:	c7 45 f0 58 0a 00 00 	movl   $0xa58,-0x10(%ebp)
 740:	8b 45 f0             	mov    -0x10(%ebp),%eax
 743:	a3 60 0a 00 00       	mov    %eax,0xa60
 748:	a1 60 0a 00 00       	mov    0xa60,%eax
 74d:	a3 58 0a 00 00       	mov    %eax,0xa58
    base.s.size = 0;
 752:	c7 05 5c 0a 00 00 00 	movl   $0x0,0xa5c
 759:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75f:	8b 00                	mov    (%eax),%eax
 761:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 764:	8b 45 f4             	mov    -0xc(%ebp),%eax
 767:	8b 40 04             	mov    0x4(%eax),%eax
 76a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 76d:	72 4d                	jb     7bc <malloc+0xa6>
      if(p->s.size == nunits)
 76f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 772:	8b 40 04             	mov    0x4(%eax),%eax
 775:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 778:	75 0c                	jne    786 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 77a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77d:	8b 10                	mov    (%eax),%edx
 77f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 782:	89 10                	mov    %edx,(%eax)
 784:	eb 26                	jmp    7ac <malloc+0x96>
      else {
        p->s.size -= nunits;
 786:	8b 45 f4             	mov    -0xc(%ebp),%eax
 789:	8b 40 04             	mov    0x4(%eax),%eax
 78c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 78f:	89 c2                	mov    %eax,%edx
 791:	8b 45 f4             	mov    -0xc(%ebp),%eax
 794:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 797:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79a:	8b 40 04             	mov    0x4(%eax),%eax
 79d:	c1 e0 03             	shl    $0x3,%eax
 7a0:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a6:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7a9:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7af:	a3 60 0a 00 00       	mov    %eax,0xa60
      return (void*)(p + 1);
 7b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b7:	83 c0 08             	add    $0x8,%eax
 7ba:	eb 38                	jmp    7f4 <malloc+0xde>
    }
    if(p == freep)
 7bc:	a1 60 0a 00 00       	mov    0xa60,%eax
 7c1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7c4:	75 1b                	jne    7e1 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c9:	89 04 24             	mov    %eax,(%esp)
 7cc:	e8 ed fe ff ff       	call   6be <morecore>
 7d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7d8:	75 07                	jne    7e1 <malloc+0xcb>
        return 0;
 7da:	b8 00 00 00 00       	mov    $0x0,%eax
 7df:	eb 13                	jmp    7f4 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ea:	8b 00                	mov    (%eax),%eax
 7ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7ef:	e9 70 ff ff ff       	jmp    764 <malloc+0x4e>
}
 7f4:	c9                   	leave  
 7f5:	c3                   	ret    
