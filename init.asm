
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 e5 08 00 00 	movl   $0x8e5,(%esp)
  18:	e8 a9 03 00 00       	call   3c6 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 e5 08 00 00 	movl   $0x8e5,(%esp)
  38:	e8 91 03 00 00       	call   3ce <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 e5 08 00 00 	movl   $0x8e5,(%esp)
  4c:	e8 75 03 00 00       	call   3c6 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 a1 03 00 00       	call   3fe <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 95 03 00 00       	call   3fe <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 ed 08 00 	movl   $0x8ed,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 99 04 00 00       	call   516 <printf>
    pid = fork(0,0);
  7d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  84:	00 
  85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8c:	e8 ed 02 00 00       	call   37e <fork>
  91:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  95:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  9a:	79 19                	jns    b5 <main+0xb5>
      printf(1, "init: fork failed\n");
  9c:	c7 44 24 04 00 09 00 	movl   $0x900,0x4(%esp)
  a3:	00 
  a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ab:	e8 66 04 00 00       	call   516 <printf>
      exit();
  b0:	e8 d1 02 00 00       	call   386 <exit>
    }
    if(pid == 0){
  b5:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ba:	75 2d                	jne    e9 <main+0xe9>
      exec("sh", argv);
  bc:	c7 44 24 04 80 0b 00 	movl   $0xb80,0x4(%esp)
  c3:	00 
  c4:	c7 04 24 e2 08 00 00 	movl   $0x8e2,(%esp)
  cb:	e8 ee 02 00 00       	call   3be <exec>
      printf(1, "init: exec sh failed\n");
  d0:	c7 44 24 04 13 09 00 	movl   $0x913,0x4(%esp)
  d7:	00 
  d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  df:	e8 32 04 00 00       	call   516 <printf>
      exit();
  e4:	e8 9d 02 00 00       	call   386 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  e9:	eb 14                	jmp    ff <main+0xff>
      printf(1, "zombie!\n");
  eb:	c7 44 24 04 29 09 00 	movl   $0x929,0x4(%esp)
  f2:	00 
  f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fa:	e8 17 04 00 00       	call   516 <printf>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  ff:	e8 8a 02 00 00       	call   38e <wait>
 104:	89 44 24 18          	mov    %eax,0x18(%esp)
 108:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 10d:	78 0a                	js     119 <main+0x119>
 10f:	8b 44 24 18          	mov    0x18(%esp),%eax
 113:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 117:	75 d2                	jne    eb <main+0xeb>
      printf(1, "zombie!\n");
  }
 119:	e9 4b ff ff ff       	jmp    69 <main+0x69>

0000011e <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	57                   	push   %edi
 122:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
 126:	8b 55 10             	mov    0x10(%ebp),%edx
 129:	8b 45 0c             	mov    0xc(%ebp),%eax
 12c:	89 cb                	mov    %ecx,%ebx
 12e:	89 df                	mov    %ebx,%edi
 130:	89 d1                	mov    %edx,%ecx
 132:	fc                   	cld    
 133:	f3 aa                	rep stos %al,%es:(%edi)
 135:	89 ca                	mov    %ecx,%edx
 137:	89 fb                	mov    %edi,%ebx
 139:	89 5d 08             	mov    %ebx,0x8(%ebp)
 13c:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 13f:	5b                   	pop    %ebx
 140:	5f                   	pop    %edi
 141:	5d                   	pop    %ebp
 142:	c3                   	ret    

00000143 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 143:	55                   	push   %ebp
 144:	89 e5                	mov    %esp,%ebp
 146:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 149:	8b 45 08             	mov    0x8(%ebp),%eax
 14c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 14f:	90                   	nop
 150:	8b 45 08             	mov    0x8(%ebp),%eax
 153:	8d 50 01             	lea    0x1(%eax),%edx
 156:	89 55 08             	mov    %edx,0x8(%ebp)
 159:	8b 55 0c             	mov    0xc(%ebp),%edx
 15c:	8d 4a 01             	lea    0x1(%edx),%ecx
 15f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 162:	0f b6 12             	movzbl (%edx),%edx
 165:	88 10                	mov    %dl,(%eax)
 167:	0f b6 00             	movzbl (%eax),%eax
 16a:	84 c0                	test   %al,%al
 16c:	75 e2                	jne    150 <strcpy+0xd>
    ;
  return os;
 16e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 171:	c9                   	leave  
 172:	c3                   	ret    

00000173 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 176:	eb 08                	jmp    180 <strcmp+0xd>
    p++, q++;
 178:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	0f b6 00             	movzbl (%eax),%eax
 186:	84 c0                	test   %al,%al
 188:	74 10                	je     19a <strcmp+0x27>
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
 18d:	0f b6 10             	movzbl (%eax),%edx
 190:	8b 45 0c             	mov    0xc(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	38 c2                	cmp    %al,%dl
 198:	74 de                	je     178 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	0f b6 00             	movzbl (%eax),%eax
 1a0:	0f b6 d0             	movzbl %al,%edx
 1a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a6:	0f b6 00             	movzbl (%eax),%eax
 1a9:	0f b6 c0             	movzbl %al,%eax
 1ac:	29 c2                	sub    %eax,%edx
 1ae:	89 d0                	mov    %edx,%eax
}
 1b0:	5d                   	pop    %ebp
 1b1:	c3                   	ret    

000001b2 <strlen>:

uint
strlen(char *s)
{
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1bf:	eb 04                	jmp    1c5 <strlen+0x13>
 1c1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
 1cb:	01 d0                	add    %edx,%eax
 1cd:	0f b6 00             	movzbl (%eax),%eax
 1d0:	84 c0                	test   %al,%al
 1d2:	75 ed                	jne    1c1 <strlen+0xf>
    ;
  return n;
 1d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d7:	c9                   	leave  
 1d8:	c3                   	ret    

000001d9 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1df:	8b 45 10             	mov    0x10(%ebp),%eax
 1e2:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ed:	8b 45 08             	mov    0x8(%ebp),%eax
 1f0:	89 04 24             	mov    %eax,(%esp)
 1f3:	e8 26 ff ff ff       	call   11e <stosb>
  return dst;
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1fb:	c9                   	leave  
 1fc:	c3                   	ret    

000001fd <strchr>:

char*
strchr(const char *s, char c)
{
 1fd:	55                   	push   %ebp
 1fe:	89 e5                	mov    %esp,%ebp
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 209:	eb 14                	jmp    21f <strchr+0x22>
    if(*s == c)
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	0f b6 00             	movzbl (%eax),%eax
 211:	3a 45 fc             	cmp    -0x4(%ebp),%al
 214:	75 05                	jne    21b <strchr+0x1e>
      return (char*)s;
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	eb 13                	jmp    22e <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 21b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 229:	b8 00 00 00 00       	mov    $0x0,%eax
}
 22e:	c9                   	leave  
 22f:	c3                   	ret    

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 236:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 23d:	eb 4c                	jmp    28b <gets+0x5b>
    cc = read(0, &c, 1);
 23f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 246:	00 
 247:	8d 45 ef             	lea    -0x11(%ebp),%eax
 24a:	89 44 24 04          	mov    %eax,0x4(%esp)
 24e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 255:	e8 44 01 00 00       	call   39e <read>
 25a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 25d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 261:	7f 02                	jg     265 <gets+0x35>
      break;
 263:	eb 31                	jmp    296 <gets+0x66>
    buf[i++] = c;
 265:	8b 45 f4             	mov    -0xc(%ebp),%eax
 268:	8d 50 01             	lea    0x1(%eax),%edx
 26b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 26e:	89 c2                	mov    %eax,%edx
 270:	8b 45 08             	mov    0x8(%ebp),%eax
 273:	01 c2                	add    %eax,%edx
 275:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 279:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 27b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27f:	3c 0a                	cmp    $0xa,%al
 281:	74 13                	je     296 <gets+0x66>
 283:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 287:	3c 0d                	cmp    $0xd,%al
 289:	74 0b                	je     296 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 28b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28e:	83 c0 01             	add    $0x1,%eax
 291:	3b 45 0c             	cmp    0xc(%ebp),%eax
 294:	7c a9                	jl     23f <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 296:	8b 55 f4             	mov    -0xc(%ebp),%edx
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	01 d0                	add    %edx,%eax
 29e:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <stat>:

int
stat(char *n, struct stat *st)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ac:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b3:	00 
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	89 04 24             	mov    %eax,(%esp)
 2ba:	e8 07 01 00 00       	call   3c6 <open>
 2bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2c6:	79 07                	jns    2cf <stat+0x29>
    return -1;
 2c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cd:	eb 23                	jmp    2f2 <stat+0x4c>
  r = fstat(fd, st);
 2cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d9:	89 04 24             	mov    %eax,(%esp)
 2dc:	e8 fd 00 00 00       	call   3de <fstat>
 2e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2e7:	89 04 24             	mov    %eax,(%esp)
 2ea:	e8 bf 00 00 00       	call   3ae <close>
  return r;
 2ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2f2:	c9                   	leave  
 2f3:	c3                   	ret    

000002f4 <atoi>:

int
atoi(const char *s)
{
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 301:	eb 25                	jmp    328 <atoi+0x34>
    n = n*10 + *s++ - '0';
 303:	8b 55 fc             	mov    -0x4(%ebp),%edx
 306:	89 d0                	mov    %edx,%eax
 308:	c1 e0 02             	shl    $0x2,%eax
 30b:	01 d0                	add    %edx,%eax
 30d:	01 c0                	add    %eax,%eax
 30f:	89 c1                	mov    %eax,%ecx
 311:	8b 45 08             	mov    0x8(%ebp),%eax
 314:	8d 50 01             	lea    0x1(%eax),%edx
 317:	89 55 08             	mov    %edx,0x8(%ebp)
 31a:	0f b6 00             	movzbl (%eax),%eax
 31d:	0f be c0             	movsbl %al,%eax
 320:	01 c8                	add    %ecx,%eax
 322:	83 e8 30             	sub    $0x30,%eax
 325:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	0f b6 00             	movzbl (%eax),%eax
 32e:	3c 2f                	cmp    $0x2f,%al
 330:	7e 0a                	jle    33c <atoi+0x48>
 332:	8b 45 08             	mov    0x8(%ebp),%eax
 335:	0f b6 00             	movzbl (%eax),%eax
 338:	3c 39                	cmp    $0x39,%al
 33a:	7e c7                	jle    303 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 33c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 33f:	c9                   	leave  
 340:	c3                   	ret    

00000341 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 341:	55                   	push   %ebp
 342:	89 e5                	mov    %esp,%ebp
 344:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 347:	8b 45 08             	mov    0x8(%ebp),%eax
 34a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 34d:	8b 45 0c             	mov    0xc(%ebp),%eax
 350:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 353:	eb 17                	jmp    36c <memmove+0x2b>
    *dst++ = *src++;
 355:	8b 45 fc             	mov    -0x4(%ebp),%eax
 358:	8d 50 01             	lea    0x1(%eax),%edx
 35b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 35e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 361:	8d 4a 01             	lea    0x1(%edx),%ecx
 364:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 367:	0f b6 12             	movzbl (%edx),%edx
 36a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36c:	8b 45 10             	mov    0x10(%ebp),%eax
 36f:	8d 50 ff             	lea    -0x1(%eax),%edx
 372:	89 55 10             	mov    %edx,0x10(%ebp)
 375:	85 c0                	test   %eax,%eax
 377:	7f dc                	jg     355 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 379:	8b 45 08             	mov    0x8(%ebp),%eax
}
 37c:	c9                   	leave  
 37d:	c3                   	ret    

0000037e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37e:	b8 01 00 00 00       	mov    $0x1,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <exit>:
SYSCALL(exit)
 386:	b8 02 00 00 00       	mov    $0x2,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <wait>:
SYSCALL(wait)
 38e:	b8 03 00 00 00       	mov    $0x3,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <pipe>:
SYSCALL(pipe)
 396:	b8 04 00 00 00       	mov    $0x4,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <read>:
SYSCALL(read)
 39e:	b8 05 00 00 00       	mov    $0x5,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <write>:
SYSCALL(write)
 3a6:	b8 10 00 00 00       	mov    $0x10,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <close>:
SYSCALL(close)
 3ae:	b8 15 00 00 00       	mov    $0x15,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <kill>:
SYSCALL(kill)
 3b6:	b8 06 00 00 00       	mov    $0x6,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <exec>:
SYSCALL(exec)
 3be:	b8 07 00 00 00       	mov    $0x7,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <open>:
SYSCALL(open)
 3c6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <mknod>:
SYSCALL(mknod)
 3ce:	b8 11 00 00 00       	mov    $0x11,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <unlink>:
SYSCALL(unlink)
 3d6:	b8 12 00 00 00       	mov    $0x12,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <fstat>:
SYSCALL(fstat)
 3de:	b8 08 00 00 00       	mov    $0x8,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <link>:
SYSCALL(link)
 3e6:	b8 13 00 00 00       	mov    $0x13,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <mkdir>:
SYSCALL(mkdir)
 3ee:	b8 14 00 00 00       	mov    $0x14,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <chdir>:
SYSCALL(chdir)
 3f6:	b8 09 00 00 00       	mov    $0x9,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <dup>:
SYSCALL(dup)
 3fe:	b8 0a 00 00 00       	mov    $0xa,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <getpid>:
SYSCALL(getpid)
 406:	b8 0b 00 00 00       	mov    $0xb,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <sbrk>:
SYSCALL(sbrk)
 40e:	b8 0c 00 00 00       	mov    $0xc,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <sleep>:
SYSCALL(sleep)
 416:	b8 0d 00 00 00       	mov    $0xd,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <uptime>:
SYSCALL(uptime)
 41e:	b8 0e 00 00 00       	mov    $0xe,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <hello>:
SYSCALL(hello)
 426:	b8 16 00 00 00       	mov    $0x16,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <cps>:
SYSCALL(cps)
 42e:	b8 17 00 00 00       	mov    $0x17,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	83 ec 18             	sub    $0x18,%esp
 43c:	8b 45 0c             	mov    0xc(%ebp),%eax
 43f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 442:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 449:	00 
 44a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 44d:	89 44 24 04          	mov    %eax,0x4(%esp)
 451:	8b 45 08             	mov    0x8(%ebp),%eax
 454:	89 04 24             	mov    %eax,(%esp)
 457:	e8 4a ff ff ff       	call   3a6 <write>
}
 45c:	c9                   	leave  
 45d:	c3                   	ret    

0000045e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 45e:	55                   	push   %ebp
 45f:	89 e5                	mov    %esp,%ebp
 461:	56                   	push   %esi
 462:	53                   	push   %ebx
 463:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 466:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 46d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 471:	74 17                	je     48a <printint+0x2c>
 473:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 477:	79 11                	jns    48a <printint+0x2c>
    neg = 1;
 479:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 480:	8b 45 0c             	mov    0xc(%ebp),%eax
 483:	f7 d8                	neg    %eax
 485:	89 45 ec             	mov    %eax,-0x14(%ebp)
 488:	eb 06                	jmp    490 <printint+0x32>
  } else {
    x = xx;
 48a:	8b 45 0c             	mov    0xc(%ebp),%eax
 48d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 490:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 497:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 49a:	8d 41 01             	lea    0x1(%ecx),%eax
 49d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4a0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4a6:	ba 00 00 00 00       	mov    $0x0,%edx
 4ab:	f7 f3                	div    %ebx
 4ad:	89 d0                	mov    %edx,%eax
 4af:	0f b6 80 88 0b 00 00 	movzbl 0xb88(%eax),%eax
 4b6:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4ba:	8b 75 10             	mov    0x10(%ebp),%esi
 4bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c0:	ba 00 00 00 00       	mov    $0x0,%edx
 4c5:	f7 f6                	div    %esi
 4c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4ca:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4ce:	75 c7                	jne    497 <printint+0x39>
  if(neg)
 4d0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4d4:	74 10                	je     4e6 <printint+0x88>
    buf[i++] = '-';
 4d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d9:	8d 50 01             	lea    0x1(%eax),%edx
 4dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4df:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4e4:	eb 1f                	jmp    505 <printint+0xa7>
 4e6:	eb 1d                	jmp    505 <printint+0xa7>
    putc(fd, buf[i]);
 4e8:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ee:	01 d0                	add    %edx,%eax
 4f0:	0f b6 00             	movzbl (%eax),%eax
 4f3:	0f be c0             	movsbl %al,%eax
 4f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	89 04 24             	mov    %eax,(%esp)
 500:	e8 31 ff ff ff       	call   436 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 505:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 509:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 50d:	79 d9                	jns    4e8 <printint+0x8a>
    putc(fd, buf[i]);
}
 50f:	83 c4 30             	add    $0x30,%esp
 512:	5b                   	pop    %ebx
 513:	5e                   	pop    %esi
 514:	5d                   	pop    %ebp
 515:	c3                   	ret    

00000516 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 51c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 523:	8d 45 0c             	lea    0xc(%ebp),%eax
 526:	83 c0 04             	add    $0x4,%eax
 529:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 52c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 533:	e9 7c 01 00 00       	jmp    6b4 <printf+0x19e>
    c = fmt[i] & 0xff;
 538:	8b 55 0c             	mov    0xc(%ebp),%edx
 53b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 53e:	01 d0                	add    %edx,%eax
 540:	0f b6 00             	movzbl (%eax),%eax
 543:	0f be c0             	movsbl %al,%eax
 546:	25 ff 00 00 00       	and    $0xff,%eax
 54b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 54e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 552:	75 2c                	jne    580 <printf+0x6a>
      if(c == '%'){
 554:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 558:	75 0c                	jne    566 <printf+0x50>
        state = '%';
 55a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 561:	e9 4a 01 00 00       	jmp    6b0 <printf+0x19a>
      } else {
        putc(fd, c);
 566:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 569:	0f be c0             	movsbl %al,%eax
 56c:	89 44 24 04          	mov    %eax,0x4(%esp)
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	89 04 24             	mov    %eax,(%esp)
 576:	e8 bb fe ff ff       	call   436 <putc>
 57b:	e9 30 01 00 00       	jmp    6b0 <printf+0x19a>
      }
    } else if(state == '%'){
 580:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 584:	0f 85 26 01 00 00    	jne    6b0 <printf+0x19a>
      if(c == 'd'){
 58a:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 58e:	75 2d                	jne    5bd <printf+0xa7>
        printint(fd, *ap, 10, 1);
 590:	8b 45 e8             	mov    -0x18(%ebp),%eax
 593:	8b 00                	mov    (%eax),%eax
 595:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 59c:	00 
 59d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5a4:	00 
 5a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	89 04 24             	mov    %eax,(%esp)
 5af:	e8 aa fe ff ff       	call   45e <printint>
        ap++;
 5b4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5b8:	e9 ec 00 00 00       	jmp    6a9 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5bd:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5c1:	74 06                	je     5c9 <printf+0xb3>
 5c3:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5c7:	75 2d                	jne    5f6 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5cc:	8b 00                	mov    (%eax),%eax
 5ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5d5:	00 
 5d6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5dd:	00 
 5de:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	89 04 24             	mov    %eax,(%esp)
 5e8:	e8 71 fe ff ff       	call   45e <printint>
        ap++;
 5ed:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5f1:	e9 b3 00 00 00       	jmp    6a9 <printf+0x193>
      } else if(c == 's'){
 5f6:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5fa:	75 45                	jne    641 <printf+0x12b>
        s = (char*)*ap;
 5fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ff:	8b 00                	mov    (%eax),%eax
 601:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 604:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 608:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 60c:	75 09                	jne    617 <printf+0x101>
          s = "(null)";
 60e:	c7 45 f4 32 09 00 00 	movl   $0x932,-0xc(%ebp)
        while(*s != 0){
 615:	eb 1e                	jmp    635 <printf+0x11f>
 617:	eb 1c                	jmp    635 <printf+0x11f>
          putc(fd, *s);
 619:	8b 45 f4             	mov    -0xc(%ebp),%eax
 61c:	0f b6 00             	movzbl (%eax),%eax
 61f:	0f be c0             	movsbl %al,%eax
 622:	89 44 24 04          	mov    %eax,0x4(%esp)
 626:	8b 45 08             	mov    0x8(%ebp),%eax
 629:	89 04 24             	mov    %eax,(%esp)
 62c:	e8 05 fe ff ff       	call   436 <putc>
          s++;
 631:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 635:	8b 45 f4             	mov    -0xc(%ebp),%eax
 638:	0f b6 00             	movzbl (%eax),%eax
 63b:	84 c0                	test   %al,%al
 63d:	75 da                	jne    619 <printf+0x103>
 63f:	eb 68                	jmp    6a9 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 641:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 645:	75 1d                	jne    664 <printf+0x14e>
        putc(fd, *ap);
 647:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64a:	8b 00                	mov    (%eax),%eax
 64c:	0f be c0             	movsbl %al,%eax
 64f:	89 44 24 04          	mov    %eax,0x4(%esp)
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	89 04 24             	mov    %eax,(%esp)
 659:	e8 d8 fd ff ff       	call   436 <putc>
        ap++;
 65e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 662:	eb 45                	jmp    6a9 <printf+0x193>
      } else if(c == '%'){
 664:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 668:	75 17                	jne    681 <printf+0x16b>
        putc(fd, c);
 66a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66d:	0f be c0             	movsbl %al,%eax
 670:	89 44 24 04          	mov    %eax,0x4(%esp)
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	89 04 24             	mov    %eax,(%esp)
 67a:	e8 b7 fd ff ff       	call   436 <putc>
 67f:	eb 28                	jmp    6a9 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 681:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 688:	00 
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	89 04 24             	mov    %eax,(%esp)
 68f:	e8 a2 fd ff ff       	call   436 <putc>
        putc(fd, c);
 694:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 697:	0f be c0             	movsbl %al,%eax
 69a:	89 44 24 04          	mov    %eax,0x4(%esp)
 69e:	8b 45 08             	mov    0x8(%ebp),%eax
 6a1:	89 04 24             	mov    %eax,(%esp)
 6a4:	e8 8d fd ff ff       	call   436 <putc>
      }
      state = 0;
 6a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6b4:	8b 55 0c             	mov    0xc(%ebp),%edx
 6b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ba:	01 d0                	add    %edx,%eax
 6bc:	0f b6 00             	movzbl (%eax),%eax
 6bf:	84 c0                	test   %al,%al
 6c1:	0f 85 71 fe ff ff    	jne    538 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6c7:	c9                   	leave  
 6c8:	c3                   	ret    

000006c9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c9:	55                   	push   %ebp
 6ca:	89 e5                	mov    %esp,%ebp
 6cc:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6cf:	8b 45 08             	mov    0x8(%ebp),%eax
 6d2:	83 e8 08             	sub    $0x8,%eax
 6d5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d8:	a1 a4 0b 00 00       	mov    0xba4,%eax
 6dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e0:	eb 24                	jmp    706 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e5:	8b 00                	mov    (%eax),%eax
 6e7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ea:	77 12                	ja     6fe <free+0x35>
 6ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ef:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f2:	77 24                	ja     718 <free+0x4f>
 6f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f7:	8b 00                	mov    (%eax),%eax
 6f9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6fc:	77 1a                	ja     718 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 00                	mov    (%eax),%eax
 703:	89 45 fc             	mov    %eax,-0x4(%ebp)
 706:	8b 45 f8             	mov    -0x8(%ebp),%eax
 709:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 70c:	76 d4                	jbe    6e2 <free+0x19>
 70e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 711:	8b 00                	mov    (%eax),%eax
 713:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 716:	76 ca                	jbe    6e2 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 718:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71b:	8b 40 04             	mov    0x4(%eax),%eax
 71e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 725:	8b 45 f8             	mov    -0x8(%ebp),%eax
 728:	01 c2                	add    %eax,%edx
 72a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72d:	8b 00                	mov    (%eax),%eax
 72f:	39 c2                	cmp    %eax,%edx
 731:	75 24                	jne    757 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 733:	8b 45 f8             	mov    -0x8(%ebp),%eax
 736:	8b 50 04             	mov    0x4(%eax),%edx
 739:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73c:	8b 00                	mov    (%eax),%eax
 73e:	8b 40 04             	mov    0x4(%eax),%eax
 741:	01 c2                	add    %eax,%edx
 743:	8b 45 f8             	mov    -0x8(%ebp),%eax
 746:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 749:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74c:	8b 00                	mov    (%eax),%eax
 74e:	8b 10                	mov    (%eax),%edx
 750:	8b 45 f8             	mov    -0x8(%ebp),%eax
 753:	89 10                	mov    %edx,(%eax)
 755:	eb 0a                	jmp    761 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 10                	mov    (%eax),%edx
 75c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75f:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 40 04             	mov    0x4(%eax),%eax
 767:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	01 d0                	add    %edx,%eax
 773:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 776:	75 20                	jne    798 <free+0xcf>
    p->s.size += bp->s.size;
 778:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77b:	8b 50 04             	mov    0x4(%eax),%edx
 77e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 781:	8b 40 04             	mov    0x4(%eax),%eax
 784:	01 c2                	add    %eax,%edx
 786:	8b 45 fc             	mov    -0x4(%ebp),%eax
 789:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 78c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78f:	8b 10                	mov    (%eax),%edx
 791:	8b 45 fc             	mov    -0x4(%ebp),%eax
 794:	89 10                	mov    %edx,(%eax)
 796:	eb 08                	jmp    7a0 <free+0xd7>
  } else
    p->s.ptr = bp;
 798:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 79e:	89 10                	mov    %edx,(%eax)
  freep = p;
 7a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a3:	a3 a4 0b 00 00       	mov    %eax,0xba4
}
 7a8:	c9                   	leave  
 7a9:	c3                   	ret    

000007aa <morecore>:

static Header*
morecore(uint nu)
{
 7aa:	55                   	push   %ebp
 7ab:	89 e5                	mov    %esp,%ebp
 7ad:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7b0:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7b7:	77 07                	ja     7c0 <morecore+0x16>
    nu = 4096;
 7b9:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7c0:	8b 45 08             	mov    0x8(%ebp),%eax
 7c3:	c1 e0 03             	shl    $0x3,%eax
 7c6:	89 04 24             	mov    %eax,(%esp)
 7c9:	e8 40 fc ff ff       	call   40e <sbrk>
 7ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7d1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7d5:	75 07                	jne    7de <morecore+0x34>
    return 0;
 7d7:	b8 00 00 00 00       	mov    $0x0,%eax
 7dc:	eb 22                	jmp    800 <morecore+0x56>
  hp = (Header*)p;
 7de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e7:	8b 55 08             	mov    0x8(%ebp),%edx
 7ea:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f0:	83 c0 08             	add    $0x8,%eax
 7f3:	89 04 24             	mov    %eax,(%esp)
 7f6:	e8 ce fe ff ff       	call   6c9 <free>
  return freep;
 7fb:	a1 a4 0b 00 00       	mov    0xba4,%eax
}
 800:	c9                   	leave  
 801:	c3                   	ret    

00000802 <malloc>:

void*
malloc(uint nbytes)
{
 802:	55                   	push   %ebp
 803:	89 e5                	mov    %esp,%ebp
 805:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 808:	8b 45 08             	mov    0x8(%ebp),%eax
 80b:	83 c0 07             	add    $0x7,%eax
 80e:	c1 e8 03             	shr    $0x3,%eax
 811:	83 c0 01             	add    $0x1,%eax
 814:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 817:	a1 a4 0b 00 00       	mov    0xba4,%eax
 81c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 81f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 823:	75 23                	jne    848 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 825:	c7 45 f0 9c 0b 00 00 	movl   $0xb9c,-0x10(%ebp)
 82c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82f:	a3 a4 0b 00 00       	mov    %eax,0xba4
 834:	a1 a4 0b 00 00       	mov    0xba4,%eax
 839:	a3 9c 0b 00 00       	mov    %eax,0xb9c
    base.s.size = 0;
 83e:	c7 05 a0 0b 00 00 00 	movl   $0x0,0xba0
 845:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84b:	8b 00                	mov    (%eax),%eax
 84d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 850:	8b 45 f4             	mov    -0xc(%ebp),%eax
 853:	8b 40 04             	mov    0x4(%eax),%eax
 856:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 859:	72 4d                	jb     8a8 <malloc+0xa6>
      if(p->s.size == nunits)
 85b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85e:	8b 40 04             	mov    0x4(%eax),%eax
 861:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 864:	75 0c                	jne    872 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 866:	8b 45 f4             	mov    -0xc(%ebp),%eax
 869:	8b 10                	mov    (%eax),%edx
 86b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86e:	89 10                	mov    %edx,(%eax)
 870:	eb 26                	jmp    898 <malloc+0x96>
      else {
        p->s.size -= nunits;
 872:	8b 45 f4             	mov    -0xc(%ebp),%eax
 875:	8b 40 04             	mov    0x4(%eax),%eax
 878:	2b 45 ec             	sub    -0x14(%ebp),%eax
 87b:	89 c2                	mov    %eax,%edx
 87d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 880:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 883:	8b 45 f4             	mov    -0xc(%ebp),%eax
 886:	8b 40 04             	mov    0x4(%eax),%eax
 889:	c1 e0 03             	shl    $0x3,%eax
 88c:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 88f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 892:	8b 55 ec             	mov    -0x14(%ebp),%edx
 895:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 898:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89b:	a3 a4 0b 00 00       	mov    %eax,0xba4
      return (void*)(p + 1);
 8a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a3:	83 c0 08             	add    $0x8,%eax
 8a6:	eb 38                	jmp    8e0 <malloc+0xde>
    }
    if(p == freep)
 8a8:	a1 a4 0b 00 00       	mov    0xba4,%eax
 8ad:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8b0:	75 1b                	jne    8cd <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b5:	89 04 24             	mov    %eax,(%esp)
 8b8:	e8 ed fe ff ff       	call   7aa <morecore>
 8bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c4:	75 07                	jne    8cd <malloc+0xcb>
        return 0;
 8c6:	b8 00 00 00 00       	mov    $0x0,%eax
 8cb:	eb 13                	jmp    8e0 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	8b 00                	mov    (%eax),%eax
 8d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8db:	e9 70 ff ff ff       	jmp    850 <malloc+0x4e>
}
 8e0:	c9                   	leave  
 8e1:	c3                   	ret    
