
_teste:     file format elf32-i386


Disassembly of section .text:

00000000 <stoi>:
#include "fcntl.h"
#include "param.h"


int stoi(char * str_num)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 10             	sub    $0x10,%esp
        int k = 0;
   6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
        char * ptr = str_num;
   d:	8b 45 08             	mov    0x8(%ebp),%eax
  10:	89 45 f8             	mov    %eax,-0x8(%ebp)
        while(*ptr)	{
  13:	eb 22                	jmp    37 <stoi+0x37>
                k *= 10;
  15:	8b 55 fc             	mov    -0x4(%ebp),%edx
  18:	89 d0                	mov    %edx,%eax
  1a:	c1 e0 02             	shl    $0x2,%eax
  1d:	01 d0                	add    %edx,%eax
  1f:	01 c0                	add    %eax,%eax
  21:	89 45 fc             	mov    %eax,-0x4(%ebp)
				k += *ptr-'0';
  24:	8b 45 f8             	mov    -0x8(%ebp),%eax
  27:	0f b6 00             	movzbl (%eax),%eax
  2a:	0f be c0             	movsbl %al,%eax
  2d:	83 e8 30             	sub    $0x30,%eax
  30:	01 45 fc             	add    %eax,-0x4(%ebp)
                ptr++;
  33:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)

int stoi(char * str_num)
{
        int k = 0;
        char * ptr = str_num;
        while(*ptr)	{
  37:	8b 45 f8             	mov    -0x8(%ebp),%eax
  3a:	0f b6 00             	movzbl (%eax),%eax
  3d:	84 c0                	test   %al,%al
  3f:	75 d4                	jne    15 <stoi+0x15>
                k *= 10;
				k += *ptr-'0';
                ptr++;
        }
        return k;
  41:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  44:	c9                   	leave  
  45:	c3                   	ret    

00000046 <test>:

void test(int T, int i, char * name){
  46:	55                   	push   %ebp
  47:	89 e5                	mov    %esp,%ebp
  49:	83 ec 28             	sub    $0x28,%esp
		int j;
                int k;
//printf(1,"T %d \n",T);

		for(j = 0; j < 1; j++)
  4c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  53:	eb 3b                	jmp    90 <test+0x4a>
                {
				
				printf(1, "%s - %d tickets\n", name, i); 
  55:	8b 45 0c             	mov    0xc(%ebp),%eax
  58:	89 44 24 0c          	mov    %eax,0xc(%esp)
  5c:	8b 45 10             	mov    0x10(%ebp),%eax
  5f:	89 44 24 08          	mov    %eax,0x8(%esp)
  63:	c7 44 24 04 3b 09 00 	movl   $0x93b,0x4(%esp)
  6a:	00 
  6b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  72:	e8 f8 04 00 00       	call   56f <printf>
                                for(k = 0; k < T; k++);
  77:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  7e:	eb 04                	jmp    84 <test+0x3e>
  80:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  84:	8b 45 f0             	mov    -0x10(%ebp),%eax
  87:	3b 45 08             	cmp    0x8(%ebp),%eax
  8a:	7c f4                	jl     80 <test+0x3a>
void test(int T, int i, char * name){
		int j;
                int k;
//printf(1,"T %d \n",T);

		for(j = 0; j < 1; j++)
  8c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  90:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  94:	7e bf                	jle    55 <test+0xf>
                {
				
				printf(1, "%s - %d tickets\n", name, i); 
                                for(k = 0; k < T; k++);
		}
		exit();
  96:	e8 44 03 00 00       	call   3df <exit>

0000009b <main>:
}


int main(int argc, char **argv)
{
  9b:	55                   	push   %ebp
  9c:	89 e5                	mov    %esp,%ebp
  9e:	83 e4 f0             	and    $0xfffffff0,%esp
  a1:	83 ec 20             	sub    $0x20,%esp
  int PID, T;
      // T = stoi(argv[1]);
       T=190000000;
  a4:	c7 44 24 1c 80 2b 53 	movl   $0xb532b80,0x1c(%esp)
  ab:	0b 

       PID = fork( N_TICKETS,1);
  ac:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  b3:	00 
  b4:	c7 04 24 fa 00 00 00 	movl   $0xfa,(%esp)
  bb:	e8 17 03 00 00       	call   3d7 <fork>
  c0:	89 44 24 18          	mov    %eax,0x18(%esp)
        if(PID == 0) {
  c4:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  c9:	75 21                	jne    ec <main+0x51>
			test(T,  N_TICKETS, "process p1" );   
  cb:	c7 44 24 08 4c 09 00 	movl   $0x94c,0x8(%esp)
  d2:	00 
  d3:	c7 44 24 04 fa 00 00 	movl   $0xfa,0x4(%esp)
  da:	00 
  db:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  df:	89 04 24             	mov    %eax,(%esp)
  e2:	e8 5f ff ff ff       	call   46 <test>
  e7:	e9 86 00 00 00       	jmp    172 <main+0xd7>
		}else if(PID > 0)        {
  ec:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  f1:	7e 7f                	jle    172 <main+0xd7>
				PID = fork( N_TICKETS, 1);
  f3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 fa 00 00 00 	movl   $0xfa,(%esp)
 102:	e8 d0 02 00 00       	call   3d7 <fork>
 107:	89 44 24 18          	mov    %eax,0x18(%esp)
				if(PID == 0)	{
 10b:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 110:	75 1e                	jne    130 <main+0x95>
					test(T, N_TICKETS, "process p2");
 112:	c7 44 24 08 57 09 00 	movl   $0x957,0x8(%esp)
 119:	00 
 11a:	c7 44 24 04 fa 00 00 	movl   $0xfa,0x4(%esp)
 121:	00 
 122:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 126:	89 04 24             	mov    %eax,(%esp)
 129:	e8 18 ff ff ff       	call   46 <test>
 12e:	eb 42                	jmp    172 <main+0xd7>
				}else if(PID > 0)	{
 130:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 135:	7e 3b                	jle    172 <main+0xd7>
						PID = fork( N_TICKETS, 1);
 137:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 13e:	00 
 13f:	c7 04 24 fa 00 00 00 	movl   $0xfa,(%esp)
 146:	e8 8c 02 00 00       	call   3d7 <fork>
 14b:	89 44 24 18          	mov    %eax,0x18(%esp)
						if(PID == 0){
 14f:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 154:	75 1c                	jne    172 <main+0xd7>
								test(T, N_TICKETS, "process p3");
 156:	c7 44 24 08 62 09 00 	movl   $0x962,0x8(%esp)
 15d:	00 
 15e:	c7 44 24 04 fa 00 00 	movl   $0xfa,0x4(%esp)
 165:	00 
 166:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 16a:	89 04 24             	mov    %eax,(%esp)
 16d:	e8 d4 fe ff ff       	call   46 <test>
						}        
				}
		}
exit();
 172:	e8 68 02 00 00       	call   3df <exit>

00000177 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 177:	55                   	push   %ebp
 178:	89 e5                	mov    %esp,%ebp
 17a:	57                   	push   %edi
 17b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 17c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17f:	8b 55 10             	mov    0x10(%ebp),%edx
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	89 cb                	mov    %ecx,%ebx
 187:	89 df                	mov    %ebx,%edi
 189:	89 d1                	mov    %edx,%ecx
 18b:	fc                   	cld    
 18c:	f3 aa                	rep stos %al,%es:(%edi)
 18e:	89 ca                	mov    %ecx,%edx
 190:	89 fb                	mov    %edi,%ebx
 192:	89 5d 08             	mov    %ebx,0x8(%ebp)
 195:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 198:	5b                   	pop    %ebx
 199:	5f                   	pop    %edi
 19a:	5d                   	pop    %ebp
 19b:	c3                   	ret    

0000019c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1a2:	8b 45 08             	mov    0x8(%ebp),%eax
 1a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1a8:	90                   	nop
 1a9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ac:	8d 50 01             	lea    0x1(%eax),%edx
 1af:	89 55 08             	mov    %edx,0x8(%ebp)
 1b2:	8b 55 0c             	mov    0xc(%ebp),%edx
 1b5:	8d 4a 01             	lea    0x1(%edx),%ecx
 1b8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1bb:	0f b6 12             	movzbl (%edx),%edx
 1be:	88 10                	mov    %dl,(%eax)
 1c0:	0f b6 00             	movzbl (%eax),%eax
 1c3:	84 c0                	test   %al,%al
 1c5:	75 e2                	jne    1a9 <strcpy+0xd>
    ;
  return os;
 1c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    

000001cc <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1cf:	eb 08                	jmp    1d9 <strcmp+0xd>
    p++, q++;
 1d1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1d5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	0f b6 00             	movzbl (%eax),%eax
 1df:	84 c0                	test   %al,%al
 1e1:	74 10                	je     1f3 <strcmp+0x27>
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 10             	movzbl (%eax),%edx
 1e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ec:	0f b6 00             	movzbl (%eax),%eax
 1ef:	38 c2                	cmp    %al,%dl
 1f1:	74 de                	je     1d1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 00             	movzbl (%eax),%eax
 1f9:	0f b6 d0             	movzbl %al,%edx
 1fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	0f b6 c0             	movzbl %al,%eax
 205:	29 c2                	sub    %eax,%edx
 207:	89 d0                	mov    %edx,%eax
}
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    

0000020b <strlen>:

uint
strlen(char *s)
{
 20b:	55                   	push   %ebp
 20c:	89 e5                	mov    %esp,%ebp
 20e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 211:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 218:	eb 04                	jmp    21e <strlen+0x13>
 21a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 21e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	01 d0                	add    %edx,%eax
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	84 c0                	test   %al,%al
 22b:	75 ed                	jne    21a <strlen+0xf>
    ;
  return n;
 22d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 230:	c9                   	leave  
 231:	c3                   	ret    

00000232 <memset>:

void*
memset(void *dst, int c, uint n)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 238:	8b 45 10             	mov    0x10(%ebp),%eax
 23b:	89 44 24 08          	mov    %eax,0x8(%esp)
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	89 44 24 04          	mov    %eax,0x4(%esp)
 246:	8b 45 08             	mov    0x8(%ebp),%eax
 249:	89 04 24             	mov    %eax,(%esp)
 24c:	e8 26 ff ff ff       	call   177 <stosb>
  return dst;
 251:	8b 45 08             	mov    0x8(%ebp),%eax
}
 254:	c9                   	leave  
 255:	c3                   	ret    

00000256 <strchr>:

char*
strchr(const char *s, char c)
{
 256:	55                   	push   %ebp
 257:	89 e5                	mov    %esp,%ebp
 259:	83 ec 04             	sub    $0x4,%esp
 25c:	8b 45 0c             	mov    0xc(%ebp),%eax
 25f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 262:	eb 14                	jmp    278 <strchr+0x22>
    if(*s == c)
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	0f b6 00             	movzbl (%eax),%eax
 26a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 26d:	75 05                	jne    274 <strchr+0x1e>
      return (char*)s;
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	eb 13                	jmp    287 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 274:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	84 c0                	test   %al,%al
 280:	75 e2                	jne    264 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 282:	b8 00 00 00 00       	mov    $0x0,%eax
}
 287:	c9                   	leave  
 288:	c3                   	ret    

00000289 <gets>:

char*
gets(char *buf, int max)
{
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 28f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 296:	eb 4c                	jmp    2e4 <gets+0x5b>
    cc = read(0, &c, 1);
 298:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 29f:	00 
 2a0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ae:	e8 44 01 00 00       	call   3f7 <read>
 2b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2ba:	7f 02                	jg     2be <gets+0x35>
      break;
 2bc:	eb 31                	jmp    2ef <gets+0x66>
    buf[i++] = c;
 2be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2c1:	8d 50 01             	lea    0x1(%eax),%edx
 2c4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2c7:	89 c2                	mov    %eax,%edx
 2c9:	8b 45 08             	mov    0x8(%ebp),%eax
 2cc:	01 c2                	add    %eax,%edx
 2ce:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2d2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 2d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2d8:	3c 0a                	cmp    $0xa,%al
 2da:	74 13                	je     2ef <gets+0x66>
 2dc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2e0:	3c 0d                	cmp    $0xd,%al
 2e2:	74 0b                	je     2ef <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2e7:	83 c0 01             	add    $0x1,%eax
 2ea:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2ed:	7c a9                	jl     298 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2f2:	8b 45 08             	mov    0x8(%ebp),%eax
 2f5:	01 d0                	add    %edx,%eax
 2f7:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2fa:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2fd:	c9                   	leave  
 2fe:	c3                   	ret    

000002ff <stat>:

int
stat(char *n, struct stat *st)
{
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 305:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 30c:	00 
 30d:	8b 45 08             	mov    0x8(%ebp),%eax
 310:	89 04 24             	mov    %eax,(%esp)
 313:	e8 07 01 00 00       	call   41f <open>
 318:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 31b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 31f:	79 07                	jns    328 <stat+0x29>
    return -1;
 321:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 326:	eb 23                	jmp    34b <stat+0x4c>
  r = fstat(fd, st);
 328:	8b 45 0c             	mov    0xc(%ebp),%eax
 32b:	89 44 24 04          	mov    %eax,0x4(%esp)
 32f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 332:	89 04 24             	mov    %eax,(%esp)
 335:	e8 fd 00 00 00       	call   437 <fstat>
 33a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 33d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 bf 00 00 00       	call   407 <close>
  return r;
 348:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 34b:	c9                   	leave  
 34c:	c3                   	ret    

0000034d <atoi>:

int
atoi(const char *s)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 353:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 35a:	eb 25                	jmp    381 <atoi+0x34>
    n = n*10 + *s++ - '0';
 35c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 35f:	89 d0                	mov    %edx,%eax
 361:	c1 e0 02             	shl    $0x2,%eax
 364:	01 d0                	add    %edx,%eax
 366:	01 c0                	add    %eax,%eax
 368:	89 c1                	mov    %eax,%ecx
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	8d 50 01             	lea    0x1(%eax),%edx
 370:	89 55 08             	mov    %edx,0x8(%ebp)
 373:	0f b6 00             	movzbl (%eax),%eax
 376:	0f be c0             	movsbl %al,%eax
 379:	01 c8                	add    %ecx,%eax
 37b:	83 e8 30             	sub    $0x30,%eax
 37e:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 381:	8b 45 08             	mov    0x8(%ebp),%eax
 384:	0f b6 00             	movzbl (%eax),%eax
 387:	3c 2f                	cmp    $0x2f,%al
 389:	7e 0a                	jle    395 <atoi+0x48>
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	0f b6 00             	movzbl (%eax),%eax
 391:	3c 39                	cmp    $0x39,%al
 393:	7e c7                	jle    35c <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 395:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 398:	c9                   	leave  
 399:	c3                   	ret    

0000039a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
 39d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3a0:	8b 45 08             	mov    0x8(%ebp),%eax
 3a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3ac:	eb 17                	jmp    3c5 <memmove+0x2b>
    *dst++ = *src++;
 3ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3b1:	8d 50 01             	lea    0x1(%eax),%edx
 3b4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3b7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3ba:	8d 4a 01             	lea    0x1(%edx),%ecx
 3bd:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3c0:	0f b6 12             	movzbl (%edx),%edx
 3c3:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c5:	8b 45 10             	mov    0x10(%ebp),%eax
 3c8:	8d 50 ff             	lea    -0x1(%eax),%edx
 3cb:	89 55 10             	mov    %edx,0x10(%ebp)
 3ce:	85 c0                	test   %eax,%eax
 3d0:	7f dc                	jg     3ae <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3d2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3d5:	c9                   	leave  
 3d6:	c3                   	ret    

000003d7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3d7:	b8 01 00 00 00       	mov    $0x1,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <exit>:
SYSCALL(exit)
 3df:	b8 02 00 00 00       	mov    $0x2,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <wait>:
SYSCALL(wait)
 3e7:	b8 03 00 00 00       	mov    $0x3,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <pipe>:
SYSCALL(pipe)
 3ef:	b8 04 00 00 00       	mov    $0x4,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <read>:
SYSCALL(read)
 3f7:	b8 05 00 00 00       	mov    $0x5,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <write>:
SYSCALL(write)
 3ff:	b8 10 00 00 00       	mov    $0x10,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <close>:
SYSCALL(close)
 407:	b8 15 00 00 00       	mov    $0x15,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <kill>:
SYSCALL(kill)
 40f:	b8 06 00 00 00       	mov    $0x6,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <exec>:
SYSCALL(exec)
 417:	b8 07 00 00 00       	mov    $0x7,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <open>:
SYSCALL(open)
 41f:	b8 0f 00 00 00       	mov    $0xf,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <mknod>:
SYSCALL(mknod)
 427:	b8 11 00 00 00       	mov    $0x11,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <unlink>:
SYSCALL(unlink)
 42f:	b8 12 00 00 00       	mov    $0x12,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <fstat>:
SYSCALL(fstat)
 437:	b8 08 00 00 00       	mov    $0x8,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <link>:
SYSCALL(link)
 43f:	b8 13 00 00 00       	mov    $0x13,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <mkdir>:
SYSCALL(mkdir)
 447:	b8 14 00 00 00       	mov    $0x14,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <chdir>:
SYSCALL(chdir)
 44f:	b8 09 00 00 00       	mov    $0x9,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <dup>:
SYSCALL(dup)
 457:	b8 0a 00 00 00       	mov    $0xa,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <getpid>:
SYSCALL(getpid)
 45f:	b8 0b 00 00 00       	mov    $0xb,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <sbrk>:
SYSCALL(sbrk)
 467:	b8 0c 00 00 00       	mov    $0xc,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <sleep>:
SYSCALL(sleep)
 46f:	b8 0d 00 00 00       	mov    $0xd,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <uptime>:
SYSCALL(uptime)
 477:	b8 0e 00 00 00       	mov    $0xe,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <hello>:
SYSCALL(hello)
 47f:	b8 16 00 00 00       	mov    $0x16,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <cps>:
SYSCALL(cps)
 487:	b8 17 00 00 00       	mov    $0x17,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 48f:	55                   	push   %ebp
 490:	89 e5                	mov    %esp,%ebp
 492:	83 ec 18             	sub    $0x18,%esp
 495:	8b 45 0c             	mov    0xc(%ebp),%eax
 498:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 49b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a2:	00 
 4a3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4aa:	8b 45 08             	mov    0x8(%ebp),%eax
 4ad:	89 04 24             	mov    %eax,(%esp)
 4b0:	e8 4a ff ff ff       	call   3ff <write>
}
 4b5:	c9                   	leave  
 4b6:	c3                   	ret    

000004b7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4b7:	55                   	push   %ebp
 4b8:	89 e5                	mov    %esp,%ebp
 4ba:	56                   	push   %esi
 4bb:	53                   	push   %ebx
 4bc:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4c6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4ca:	74 17                	je     4e3 <printint+0x2c>
 4cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4d0:	79 11                	jns    4e3 <printint+0x2c>
    neg = 1;
 4d2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dc:	f7 d8                	neg    %eax
 4de:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e1:	eb 06                	jmp    4e9 <printint+0x32>
  } else {
    x = xx;
 4e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4f3:	8d 41 01             	lea    0x1(%ecx),%eax
 4f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ff:	ba 00 00 00 00       	mov    $0x0,%edx
 504:	f7 f3                	div    %ebx
 506:	89 d0                	mov    %edx,%eax
 508:	0f b6 80 f4 0b 00 00 	movzbl 0xbf4(%eax),%eax
 50f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 513:	8b 75 10             	mov    0x10(%ebp),%esi
 516:	8b 45 ec             	mov    -0x14(%ebp),%eax
 519:	ba 00 00 00 00       	mov    $0x0,%edx
 51e:	f7 f6                	div    %esi
 520:	89 45 ec             	mov    %eax,-0x14(%ebp)
 523:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 527:	75 c7                	jne    4f0 <printint+0x39>
  if(neg)
 529:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 52d:	74 10                	je     53f <printint+0x88>
    buf[i++] = '-';
 52f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 532:	8d 50 01             	lea    0x1(%eax),%edx
 535:	89 55 f4             	mov    %edx,-0xc(%ebp)
 538:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 53d:	eb 1f                	jmp    55e <printint+0xa7>
 53f:	eb 1d                	jmp    55e <printint+0xa7>
    putc(fd, buf[i]);
 541:	8d 55 dc             	lea    -0x24(%ebp),%edx
 544:	8b 45 f4             	mov    -0xc(%ebp),%eax
 547:	01 d0                	add    %edx,%eax
 549:	0f b6 00             	movzbl (%eax),%eax
 54c:	0f be c0             	movsbl %al,%eax
 54f:	89 44 24 04          	mov    %eax,0x4(%esp)
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	89 04 24             	mov    %eax,(%esp)
 559:	e8 31 ff ff ff       	call   48f <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 55e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 562:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 566:	79 d9                	jns    541 <printint+0x8a>
    putc(fd, buf[i]);
}
 568:	83 c4 30             	add    $0x30,%esp
 56b:	5b                   	pop    %ebx
 56c:	5e                   	pop    %esi
 56d:	5d                   	pop    %ebp
 56e:	c3                   	ret    

0000056f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 56f:	55                   	push   %ebp
 570:	89 e5                	mov    %esp,%ebp
 572:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 575:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 57c:	8d 45 0c             	lea    0xc(%ebp),%eax
 57f:	83 c0 04             	add    $0x4,%eax
 582:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 585:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 58c:	e9 7c 01 00 00       	jmp    70d <printf+0x19e>
    c = fmt[i] & 0xff;
 591:	8b 55 0c             	mov    0xc(%ebp),%edx
 594:	8b 45 f0             	mov    -0x10(%ebp),%eax
 597:	01 d0                	add    %edx,%eax
 599:	0f b6 00             	movzbl (%eax),%eax
 59c:	0f be c0             	movsbl %al,%eax
 59f:	25 ff 00 00 00       	and    $0xff,%eax
 5a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5a7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ab:	75 2c                	jne    5d9 <printf+0x6a>
      if(c == '%'){
 5ad:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b1:	75 0c                	jne    5bf <printf+0x50>
        state = '%';
 5b3:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5ba:	e9 4a 01 00 00       	jmp    709 <printf+0x19a>
      } else {
        putc(fd, c);
 5bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c2:	0f be c0             	movsbl %al,%eax
 5c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c9:	8b 45 08             	mov    0x8(%ebp),%eax
 5cc:	89 04 24             	mov    %eax,(%esp)
 5cf:	e8 bb fe ff ff       	call   48f <putc>
 5d4:	e9 30 01 00 00       	jmp    709 <printf+0x19a>
      }
    } else if(state == '%'){
 5d9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5dd:	0f 85 26 01 00 00    	jne    709 <printf+0x19a>
      if(c == 'd'){
 5e3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5e7:	75 2d                	jne    616 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ec:	8b 00                	mov    (%eax),%eax
 5ee:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5f5:	00 
 5f6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5fd:	00 
 5fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 602:	8b 45 08             	mov    0x8(%ebp),%eax
 605:	89 04 24             	mov    %eax,(%esp)
 608:	e8 aa fe ff ff       	call   4b7 <printint>
        ap++;
 60d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 611:	e9 ec 00 00 00       	jmp    702 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 616:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 61a:	74 06                	je     622 <printf+0xb3>
 61c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 620:	75 2d                	jne    64f <printf+0xe0>
        printint(fd, *ap, 16, 0);
 622:	8b 45 e8             	mov    -0x18(%ebp),%eax
 625:	8b 00                	mov    (%eax),%eax
 627:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 62e:	00 
 62f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 636:	00 
 637:	89 44 24 04          	mov    %eax,0x4(%esp)
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	89 04 24             	mov    %eax,(%esp)
 641:	e8 71 fe ff ff       	call   4b7 <printint>
        ap++;
 646:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 64a:	e9 b3 00 00 00       	jmp    702 <printf+0x193>
      } else if(c == 's'){
 64f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 653:	75 45                	jne    69a <printf+0x12b>
        s = (char*)*ap;
 655:	8b 45 e8             	mov    -0x18(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 65d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 661:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 665:	75 09                	jne    670 <printf+0x101>
          s = "(null)";
 667:	c7 45 f4 6d 09 00 00 	movl   $0x96d,-0xc(%ebp)
        while(*s != 0){
 66e:	eb 1e                	jmp    68e <printf+0x11f>
 670:	eb 1c                	jmp    68e <printf+0x11f>
          putc(fd, *s);
 672:	8b 45 f4             	mov    -0xc(%ebp),%eax
 675:	0f b6 00             	movzbl (%eax),%eax
 678:	0f be c0             	movsbl %al,%eax
 67b:	89 44 24 04          	mov    %eax,0x4(%esp)
 67f:	8b 45 08             	mov    0x8(%ebp),%eax
 682:	89 04 24             	mov    %eax,(%esp)
 685:	e8 05 fe ff ff       	call   48f <putc>
          s++;
 68a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 691:	0f b6 00             	movzbl (%eax),%eax
 694:	84 c0                	test   %al,%al
 696:	75 da                	jne    672 <printf+0x103>
 698:	eb 68                	jmp    702 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 69a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 69e:	75 1d                	jne    6bd <printf+0x14e>
        putc(fd, *ap);
 6a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a3:	8b 00                	mov    (%eax),%eax
 6a5:	0f be c0             	movsbl %al,%eax
 6a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ac:	8b 45 08             	mov    0x8(%ebp),%eax
 6af:	89 04 24             	mov    %eax,(%esp)
 6b2:	e8 d8 fd ff ff       	call   48f <putc>
        ap++;
 6b7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6bb:	eb 45                	jmp    702 <printf+0x193>
      } else if(c == '%'){
 6bd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c1:	75 17                	jne    6da <printf+0x16b>
        putc(fd, c);
 6c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c6:	0f be c0             	movsbl %al,%eax
 6c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	89 04 24             	mov    %eax,(%esp)
 6d3:	e8 b7 fd ff ff       	call   48f <putc>
 6d8:	eb 28                	jmp    702 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6da:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6e1:	00 
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	89 04 24             	mov    %eax,(%esp)
 6e8:	e8 a2 fd ff ff       	call   48f <putc>
        putc(fd, c);
 6ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f0:	0f be c0             	movsbl %al,%eax
 6f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 8d fd ff ff       	call   48f <putc>
      }
      state = 0;
 702:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 709:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 70d:	8b 55 0c             	mov    0xc(%ebp),%edx
 710:	8b 45 f0             	mov    -0x10(%ebp),%eax
 713:	01 d0                	add    %edx,%eax
 715:	0f b6 00             	movzbl (%eax),%eax
 718:	84 c0                	test   %al,%al
 71a:	0f 85 71 fe ff ff    	jne    591 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 720:	c9                   	leave  
 721:	c3                   	ret    

00000722 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 722:	55                   	push   %ebp
 723:	89 e5                	mov    %esp,%ebp
 725:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	83 e8 08             	sub    $0x8,%eax
 72e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 10 0c 00 00       	mov    0xc10,%eax
 736:	89 45 fc             	mov    %eax,-0x4(%ebp)
 739:	eb 24                	jmp    75f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73e:	8b 00                	mov    (%eax),%eax
 740:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 743:	77 12                	ja     757 <free+0x35>
 745:	8b 45 f8             	mov    -0x8(%ebp),%eax
 748:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74b:	77 24                	ja     771 <free+0x4f>
 74d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 750:	8b 00                	mov    (%eax),%eax
 752:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 755:	77 1a                	ja     771 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 75f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 762:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 765:	76 d4                	jbe    73b <free+0x19>
 767:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76a:	8b 00                	mov    (%eax),%eax
 76c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76f:	76 ca                	jbe    73b <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 771:	8b 45 f8             	mov    -0x8(%ebp),%eax
 774:	8b 40 04             	mov    0x4(%eax),%eax
 777:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 77e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 781:	01 c2                	add    %eax,%edx
 783:	8b 45 fc             	mov    -0x4(%ebp),%eax
 786:	8b 00                	mov    (%eax),%eax
 788:	39 c2                	cmp    %eax,%edx
 78a:	75 24                	jne    7b0 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 78c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78f:	8b 50 04             	mov    0x4(%eax),%edx
 792:	8b 45 fc             	mov    -0x4(%ebp),%eax
 795:	8b 00                	mov    (%eax),%eax
 797:	8b 40 04             	mov    0x4(%eax),%eax
 79a:	01 c2                	add    %eax,%edx
 79c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a5:	8b 00                	mov    (%eax),%eax
 7a7:	8b 10                	mov    (%eax),%edx
 7a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ac:	89 10                	mov    %edx,(%eax)
 7ae:	eb 0a                	jmp    7ba <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b3:	8b 10                	mov    (%eax),%edx
 7b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b8:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bd:	8b 40 04             	mov    0x4(%eax),%eax
 7c0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	01 d0                	add    %edx,%eax
 7cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cf:	75 20                	jne    7f1 <free+0xcf>
    p->s.size += bp->s.size;
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	8b 50 04             	mov    0x4(%eax),%edx
 7d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7da:	8b 40 04             	mov    0x4(%eax),%eax
 7dd:	01 c2                	add    %eax,%edx
 7df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	89 10                	mov    %edx,(%eax)
 7ef:	eb 08                	jmp    7f9 <free+0xd7>
  } else
    p->s.ptr = bp;
 7f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7f7:	89 10                	mov    %edx,(%eax)
  freep = p;
 7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fc:	a3 10 0c 00 00       	mov    %eax,0xc10
}
 801:	c9                   	leave  
 802:	c3                   	ret    

00000803 <morecore>:

static Header*
morecore(uint nu)
{
 803:	55                   	push   %ebp
 804:	89 e5                	mov    %esp,%ebp
 806:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 809:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 810:	77 07                	ja     819 <morecore+0x16>
    nu = 4096;
 812:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	c1 e0 03             	shl    $0x3,%eax
 81f:	89 04 24             	mov    %eax,(%esp)
 822:	e8 40 fc ff ff       	call   467 <sbrk>
 827:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 82a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 82e:	75 07                	jne    837 <morecore+0x34>
    return 0;
 830:	b8 00 00 00 00       	mov    $0x0,%eax
 835:	eb 22                	jmp    859 <morecore+0x56>
  hp = (Header*)p;
 837:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 83d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 840:	8b 55 08             	mov    0x8(%ebp),%edx
 843:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 846:	8b 45 f0             	mov    -0x10(%ebp),%eax
 849:	83 c0 08             	add    $0x8,%eax
 84c:	89 04 24             	mov    %eax,(%esp)
 84f:	e8 ce fe ff ff       	call   722 <free>
  return freep;
 854:	a1 10 0c 00 00       	mov    0xc10,%eax
}
 859:	c9                   	leave  
 85a:	c3                   	ret    

0000085b <malloc>:

void*
malloc(uint nbytes)
{
 85b:	55                   	push   %ebp
 85c:	89 e5                	mov    %esp,%ebp
 85e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 861:	8b 45 08             	mov    0x8(%ebp),%eax
 864:	83 c0 07             	add    $0x7,%eax
 867:	c1 e8 03             	shr    $0x3,%eax
 86a:	83 c0 01             	add    $0x1,%eax
 86d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 870:	a1 10 0c 00 00       	mov    0xc10,%eax
 875:	89 45 f0             	mov    %eax,-0x10(%ebp)
 878:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 87c:	75 23                	jne    8a1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 87e:	c7 45 f0 08 0c 00 00 	movl   $0xc08,-0x10(%ebp)
 885:	8b 45 f0             	mov    -0x10(%ebp),%eax
 888:	a3 10 0c 00 00       	mov    %eax,0xc10
 88d:	a1 10 0c 00 00       	mov    0xc10,%eax
 892:	a3 08 0c 00 00       	mov    %eax,0xc08
    base.s.size = 0;
 897:	c7 05 0c 0c 00 00 00 	movl   $0x0,0xc0c
 89e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a4:	8b 00                	mov    (%eax),%eax
 8a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ac:	8b 40 04             	mov    0x4(%eax),%eax
 8af:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8b2:	72 4d                	jb     901 <malloc+0xa6>
      if(p->s.size == nunits)
 8b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b7:	8b 40 04             	mov    0x4(%eax),%eax
 8ba:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8bd:	75 0c                	jne    8cb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c2:	8b 10                	mov    (%eax),%edx
 8c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c7:	89 10                	mov    %edx,(%eax)
 8c9:	eb 26                	jmp    8f1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ce:	8b 40 04             	mov    0x4(%eax),%eax
 8d1:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8d4:	89 c2                	mov    %eax,%edx
 8d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	8b 40 04             	mov    0x4(%eax),%eax
 8e2:	c1 e0 03             	shl    $0x3,%eax
 8e5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8eb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8ee:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f4:	a3 10 0c 00 00       	mov    %eax,0xc10
      return (void*)(p + 1);
 8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fc:	83 c0 08             	add    $0x8,%eax
 8ff:	eb 38                	jmp    939 <malloc+0xde>
    }
    if(p == freep)
 901:	a1 10 0c 00 00       	mov    0xc10,%eax
 906:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 909:	75 1b                	jne    926 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 90b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 90e:	89 04 24             	mov    %eax,(%esp)
 911:	e8 ed fe ff ff       	call   803 <morecore>
 916:	89 45 f4             	mov    %eax,-0xc(%ebp)
 919:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 91d:	75 07                	jne    926 <malloc+0xcb>
        return 0;
 91f:	b8 00 00 00 00       	mov    $0x0,%eax
 924:	eb 13                	jmp    939 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 926:	8b 45 f4             	mov    -0xc(%ebp),%eax
 929:	89 45 f0             	mov    %eax,-0x10(%ebp)
 92c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92f:	8b 00                	mov    (%eax),%eax
 931:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 934:	e9 70 ff ff ff       	jmp    8a9 <malloc+0x4e>
}
 939:	c9                   	leave  
 93a:	c3                   	ret    
