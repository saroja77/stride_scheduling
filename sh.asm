
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 05                	jne    11 <runcmd+0x11>
    exit();
       c:	e8 5f 0f 00 00       	call   f70 <exit>
  
  switch(cmd->type){
      11:	8b 45 08             	mov    0x8(%ebp),%eax
      14:	8b 00                	mov    (%eax),%eax
      16:	83 f8 05             	cmp    $0x5,%eax
      19:	77 09                	ja     24 <runcmd+0x24>
      1b:	8b 04 85 f8 14 00 00 	mov    0x14f8(,%eax,4),%eax
      22:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      24:	c7 04 24 cc 14 00 00 	movl   $0x14cc,(%esp)
      2b:	e8 27 03 00 00       	call   357 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      30:	8b 45 08             	mov    0x8(%ebp),%eax
      33:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
      36:	8b 45 f4             	mov    -0xc(%ebp),%eax
      39:	8b 40 04             	mov    0x4(%eax),%eax
      3c:	85 c0                	test   %eax,%eax
      3e:	75 05                	jne    45 <runcmd+0x45>
      exit();
      40:	e8 2b 0f 00 00       	call   f70 <exit>
    exec(ecmd->argv[0], ecmd->argv);
      45:	8b 45 f4             	mov    -0xc(%ebp),%eax
      48:	8d 50 04             	lea    0x4(%eax),%edx
      4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
      4e:	8b 40 04             	mov    0x4(%eax),%eax
      51:	89 54 24 04          	mov    %edx,0x4(%esp)
      55:	89 04 24             	mov    %eax,(%esp)
      58:	e8 4b 0f 00 00       	call   fa8 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      60:	8b 40 04             	mov    0x4(%eax),%eax
      63:	89 44 24 08          	mov    %eax,0x8(%esp)
      67:	c7 44 24 04 d3 14 00 	movl   $0x14d3,0x4(%esp)
      6e:	00 
      6f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      76:	e8 85 10 00 00       	call   1100 <printf>
    break;
      7b:	e9 86 01 00 00       	jmp    206 <runcmd+0x206>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      80:	8b 45 08             	mov    0x8(%ebp),%eax
      83:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(rcmd->fd);
      86:	8b 45 f0             	mov    -0x10(%ebp),%eax
      89:	8b 40 14             	mov    0x14(%eax),%eax
      8c:	89 04 24             	mov    %eax,(%esp)
      8f:	e8 04 0f 00 00       	call   f98 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      94:	8b 45 f0             	mov    -0x10(%ebp),%eax
      97:	8b 50 10             	mov    0x10(%eax),%edx
      9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
      9d:	8b 40 08             	mov    0x8(%eax),%eax
      a0:	89 54 24 04          	mov    %edx,0x4(%esp)
      a4:	89 04 24             	mov    %eax,(%esp)
      a7:	e8 04 0f 00 00       	call   fb0 <open>
      ac:	85 c0                	test   %eax,%eax
      ae:	79 23                	jns    d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
      b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
      b3:	8b 40 08             	mov    0x8(%eax),%eax
      b6:	89 44 24 08          	mov    %eax,0x8(%esp)
      ba:	c7 44 24 04 e3 14 00 	movl   $0x14e3,0x4(%esp)
      c1:	00 
      c2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      c9:	e8 32 10 00 00       	call   1100 <printf>
      exit();
      ce:	e8 9d 0e 00 00       	call   f70 <exit>
    }
    runcmd(rcmd->cmd);
      d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
      d6:	8b 40 04             	mov    0x4(%eax),%eax
      d9:	89 04 24             	mov    %eax,(%esp)
      dc:	e8 1f ff ff ff       	call   0 <runcmd>
    break;
      e1:	e9 20 01 00 00       	jmp    206 <runcmd+0x206>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      e6:	8b 45 08             	mov    0x8(%ebp),%eax
      e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
      ec:	e8 8c 02 00 00       	call   37d <fork1>
      f1:	85 c0                	test   %eax,%eax
      f3:	75 0e                	jne    103 <runcmd+0x103>
      runcmd(lcmd->left);
      f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
      f8:	8b 40 04             	mov    0x4(%eax),%eax
      fb:	89 04 24             	mov    %eax,(%esp)
      fe:	e8 fd fe ff ff       	call   0 <runcmd>
    wait();
     103:	e8 70 0e 00 00       	call   f78 <wait>
    runcmd(lcmd->right);
     108:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10b:	8b 40 08             	mov    0x8(%eax),%eax
     10e:	89 04 24             	mov    %eax,(%esp)
     111:	e8 ea fe ff ff       	call   0 <runcmd>
    break;
     116:	e9 eb 00 00 00       	jmp    206 <runcmd+0x206>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     11b:	8b 45 08             	mov    0x8(%ebp),%eax
     11e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pipe(p) < 0)
     121:	8d 45 dc             	lea    -0x24(%ebp),%eax
     124:	89 04 24             	mov    %eax,(%esp)
     127:	e8 54 0e 00 00       	call   f80 <pipe>
     12c:	85 c0                	test   %eax,%eax
     12e:	79 0c                	jns    13c <runcmd+0x13c>
      panic("pipe");
     130:	c7 04 24 f3 14 00 00 	movl   $0x14f3,(%esp)
     137:	e8 1b 02 00 00       	call   357 <panic>
    if(fork1() == 0){
     13c:	e8 3c 02 00 00       	call   37d <fork1>
     141:	85 c0                	test   %eax,%eax
     143:	75 3b                	jne    180 <runcmd+0x180>
      close(1);
     145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     14c:	e8 47 0e 00 00       	call   f98 <close>
      dup(p[1]);
     151:	8b 45 e0             	mov    -0x20(%ebp),%eax
     154:	89 04 24             	mov    %eax,(%esp)
     157:	e8 8c 0e 00 00       	call   fe8 <dup>
      close(p[0]);
     15c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     15f:	89 04 24             	mov    %eax,(%esp)
     162:	e8 31 0e 00 00       	call   f98 <close>
      close(p[1]);
     167:	8b 45 e0             	mov    -0x20(%ebp),%eax
     16a:	89 04 24             	mov    %eax,(%esp)
     16d:	e8 26 0e 00 00       	call   f98 <close>
      runcmd(pcmd->left);
     172:	8b 45 e8             	mov    -0x18(%ebp),%eax
     175:	8b 40 04             	mov    0x4(%eax),%eax
     178:	89 04 24             	mov    %eax,(%esp)
     17b:	e8 80 fe ff ff       	call   0 <runcmd>
    }
    if(fork1() == 0){
     180:	e8 f8 01 00 00       	call   37d <fork1>
     185:	85 c0                	test   %eax,%eax
     187:	75 3b                	jne    1c4 <runcmd+0x1c4>
      close(0);
     189:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     190:	e8 03 0e 00 00       	call   f98 <close>
      dup(p[0]);
     195:	8b 45 dc             	mov    -0x24(%ebp),%eax
     198:	89 04 24             	mov    %eax,(%esp)
     19b:	e8 48 0e 00 00       	call   fe8 <dup>
      close(p[0]);
     1a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1a3:	89 04 24             	mov    %eax,(%esp)
     1a6:	e8 ed 0d 00 00       	call   f98 <close>
      close(p[1]);
     1ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ae:	89 04 24             	mov    %eax,(%esp)
     1b1:	e8 e2 0d 00 00       	call   f98 <close>
      runcmd(pcmd->right);
     1b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1b9:	8b 40 08             	mov    0x8(%eax),%eax
     1bc:	89 04 24             	mov    %eax,(%esp)
     1bf:	e8 3c fe ff ff       	call   0 <runcmd>
    }
    close(p[0]);
     1c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1c7:	89 04 24             	mov    %eax,(%esp)
     1ca:	e8 c9 0d 00 00       	call   f98 <close>
    close(p[1]);
     1cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1d2:	89 04 24             	mov    %eax,(%esp)
     1d5:	e8 be 0d 00 00       	call   f98 <close>
    wait();
     1da:	e8 99 0d 00 00       	call   f78 <wait>
    wait();
     1df:	e8 94 0d 00 00       	call   f78 <wait>
    break;
     1e4:	eb 20                	jmp    206 <runcmd+0x206>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
     1e6:	8b 45 08             	mov    0x8(%ebp),%eax
     1e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     1ec:	e8 8c 01 00 00       	call   37d <fork1>
     1f1:	85 c0                	test   %eax,%eax
     1f3:	75 10                	jne    205 <runcmd+0x205>
      runcmd(bcmd->cmd);
     1f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     1f8:	8b 40 04             	mov    0x4(%eax),%eax
     1fb:	89 04 24             	mov    %eax,(%esp)
     1fe:	e8 fd fd ff ff       	call   0 <runcmd>
    break;
     203:	eb 00                	jmp    205 <runcmd+0x205>
     205:	90                   	nop
  }
  exit();
     206:	e8 65 0d 00 00       	call   f70 <exit>

0000020b <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     20b:	55                   	push   %ebp
     20c:	89 e5                	mov    %esp,%ebp
     20e:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
     211:	c7 44 24 04 10 15 00 	movl   $0x1510,0x4(%esp)
     218:	00 
     219:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     220:	e8 db 0e 00 00       	call   1100 <printf>
  memset(buf, 0, nbuf);
     225:	8b 45 0c             	mov    0xc(%ebp),%eax
     228:	89 44 24 08          	mov    %eax,0x8(%esp)
     22c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     233:	00 
     234:	8b 45 08             	mov    0x8(%ebp),%eax
     237:	89 04 24             	mov    %eax,(%esp)
     23a:	e8 84 0b 00 00       	call   dc3 <memset>
  gets(buf, nbuf);
     23f:	8b 45 0c             	mov    0xc(%ebp),%eax
     242:	89 44 24 04          	mov    %eax,0x4(%esp)
     246:	8b 45 08             	mov    0x8(%ebp),%eax
     249:	89 04 24             	mov    %eax,(%esp)
     24c:	e8 c9 0b 00 00       	call   e1a <gets>
  if(buf[0] == 0) // EOF
     251:	8b 45 08             	mov    0x8(%ebp),%eax
     254:	0f b6 00             	movzbl (%eax),%eax
     257:	84 c0                	test   %al,%al
     259:	75 07                	jne    262 <getcmd+0x57>
    return -1;
     25b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     260:	eb 05                	jmp    267 <getcmd+0x5c>
  return 0;
     262:	b8 00 00 00 00       	mov    $0x0,%eax
}
     267:	c9                   	leave  
     268:	c3                   	ret    

00000269 <main>:

int
main(void)
{
     269:	55                   	push   %ebp
     26a:	89 e5                	mov    %esp,%ebp
     26c:	83 e4 f0             	and    $0xfffffff0,%esp
     26f:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     272:	eb 15                	jmp    289 <main+0x20>
    if(fd >= 3){
     274:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
     279:	7e 0e                	jle    289 <main+0x20>
      close(fd);
     27b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     27f:	89 04 24             	mov    %eax,(%esp)
     282:	e8 11 0d 00 00       	call   f98 <close>
      break;
     287:	eb 1f                	jmp    2a8 <main+0x3f>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     289:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     290:	00 
     291:	c7 04 24 13 15 00 00 	movl   $0x1513,(%esp)
     298:	e8 13 0d 00 00       	call   fb0 <open>
     29d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     2a1:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     2a6:	79 cc                	jns    274 <main+0xb>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2a8:	e9 89 00 00 00       	jmp    336 <main+0xcd>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     2ad:	0f b6 05 80 1a 00 00 	movzbl 0x1a80,%eax
     2b4:	3c 63                	cmp    $0x63,%al
     2b6:	75 5c                	jne    314 <main+0xab>
     2b8:	0f b6 05 81 1a 00 00 	movzbl 0x1a81,%eax
     2bf:	3c 64                	cmp    $0x64,%al
     2c1:	75 51                	jne    314 <main+0xab>
     2c3:	0f b6 05 82 1a 00 00 	movzbl 0x1a82,%eax
     2ca:	3c 20                	cmp    $0x20,%al
     2cc:	75 46                	jne    314 <main+0xab>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     2ce:	c7 04 24 80 1a 00 00 	movl   $0x1a80,(%esp)
     2d5:	e8 c2 0a 00 00       	call   d9c <strlen>
     2da:	83 e8 01             	sub    $0x1,%eax
     2dd:	c6 80 80 1a 00 00 00 	movb   $0x0,0x1a80(%eax)
      if(chdir(buf+3) < 0)
     2e4:	c7 04 24 83 1a 00 00 	movl   $0x1a83,(%esp)
     2eb:	e8 f0 0c 00 00       	call   fe0 <chdir>
     2f0:	85 c0                	test   %eax,%eax
     2f2:	79 1e                	jns    312 <main+0xa9>
        printf(2, "cannot cd %s\n", buf+3);
     2f4:	c7 44 24 08 83 1a 00 	movl   $0x1a83,0x8(%esp)
     2fb:	00 
     2fc:	c7 44 24 04 1b 15 00 	movl   $0x151b,0x4(%esp)
     303:	00 
     304:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     30b:	e8 f0 0d 00 00       	call   1100 <printf>
      continue;
     310:	eb 24                	jmp    336 <main+0xcd>
     312:	eb 22                	jmp    336 <main+0xcd>
    }
    if(fork1() == 0)
     314:	e8 64 00 00 00       	call   37d <fork1>
     319:	85 c0                	test   %eax,%eax
     31b:	75 14                	jne    331 <main+0xc8>
      runcmd(parsecmd(buf));
     31d:	c7 04 24 80 1a 00 00 	movl   $0x1a80,(%esp)
     324:	e8 d8 03 00 00       	call   701 <parsecmd>
     329:	89 04 24             	mov    %eax,(%esp)
     32c:	e8 cf fc ff ff       	call   0 <runcmd>
    wait();
     331:	e8 42 0c 00 00       	call   f78 <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     336:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     33d:	00 
     33e:	c7 04 24 80 1a 00 00 	movl   $0x1a80,(%esp)
     345:	e8 c1 fe ff ff       	call   20b <getcmd>
     34a:	85 c0                	test   %eax,%eax
     34c:	0f 89 5b ff ff ff    	jns    2ad <main+0x44>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     352:	e8 19 0c 00 00       	call   f70 <exit>

00000357 <panic>:
}

void
panic(char *s)
{
     357:	55                   	push   %ebp
     358:	89 e5                	mov    %esp,%ebp
     35a:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     35d:	8b 45 08             	mov    0x8(%ebp),%eax
     360:	89 44 24 08          	mov    %eax,0x8(%esp)
     364:	c7 44 24 04 29 15 00 	movl   $0x1529,0x4(%esp)
     36b:	00 
     36c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     373:	e8 88 0d 00 00       	call   1100 <printf>
  exit();
     378:	e8 f3 0b 00 00       	call   f70 <exit>

0000037d <fork1>:
}

int
fork1(void)
{
     37d:	55                   	push   %ebp
     37e:	89 e5                	mov    %esp,%ebp
     380:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork(0,0);
     383:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     38a:	00 
     38b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     392:	e8 d1 0b 00 00       	call   f68 <fork>
     397:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     39a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     39e:	75 0c                	jne    3ac <fork1+0x2f>
    panic("fork");
     3a0:	c7 04 24 2d 15 00 00 	movl   $0x152d,(%esp)
     3a7:	e8 ab ff ff ff       	call   357 <panic>
  return pid;
     3ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3af:	c9                   	leave  
     3b0:	c3                   	ret    

000003b1 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3b1:	55                   	push   %ebp
     3b2:	89 e5                	mov    %esp,%ebp
     3b4:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b7:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3be:	e8 29 10 00 00       	call   13ec <malloc>
     3c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3c6:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     3cd:	00 
     3ce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3d5:	00 
     3d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3d9:	89 04 24             	mov    %eax,(%esp)
     3dc:	e8 e2 09 00 00       	call   dc3 <memset>
  cmd->type = EXEC;
     3e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3e4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     3ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3ed:	c9                   	leave  
     3ee:	c3                   	ret    

000003ef <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3ef:	55                   	push   %ebp
     3f0:	89 e5                	mov    %esp,%ebp
     3f2:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3f5:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3fc:	e8 eb 0f 00 00       	call   13ec <malloc>
     401:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     404:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     40b:	00 
     40c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     413:	00 
     414:	8b 45 f4             	mov    -0xc(%ebp),%eax
     417:	89 04 24             	mov    %eax,(%esp)
     41a:	e8 a4 09 00 00       	call   dc3 <memset>
  cmd->type = REDIR;
     41f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     422:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     428:	8b 45 f4             	mov    -0xc(%ebp),%eax
     42b:	8b 55 08             	mov    0x8(%ebp),%edx
     42e:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     431:	8b 45 f4             	mov    -0xc(%ebp),%eax
     434:	8b 55 0c             	mov    0xc(%ebp),%edx
     437:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     43a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     43d:	8b 55 10             	mov    0x10(%ebp),%edx
     440:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     443:	8b 45 f4             	mov    -0xc(%ebp),%eax
     446:	8b 55 14             	mov    0x14(%ebp),%edx
     449:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     44c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     44f:	8b 55 18             	mov    0x18(%ebp),%edx
     452:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     455:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     458:	c9                   	leave  
     459:	c3                   	ret    

0000045a <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     45a:	55                   	push   %ebp
     45b:	89 e5                	mov    %esp,%ebp
     45d:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     460:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     467:	e8 80 0f 00 00       	call   13ec <malloc>
     46c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     46f:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     476:	00 
     477:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     47e:	00 
     47f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     482:	89 04 24             	mov    %eax,(%esp)
     485:	e8 39 09 00 00       	call   dc3 <memset>
  cmd->type = PIPE;
     48a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     48d:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     493:	8b 45 f4             	mov    -0xc(%ebp),%eax
     496:	8b 55 08             	mov    0x8(%ebp),%edx
     499:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     49c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     49f:	8b 55 0c             	mov    0xc(%ebp),%edx
     4a2:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4a8:	c9                   	leave  
     4a9:	c3                   	ret    

000004aa <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     4aa:	55                   	push   %ebp
     4ab:	89 e5                	mov    %esp,%ebp
     4ad:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4b0:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     4b7:	e8 30 0f 00 00       	call   13ec <malloc>
     4bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4bf:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4c6:	00 
     4c7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4ce:	00 
     4cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d2:	89 04 24             	mov    %eax,(%esp)
     4d5:	e8 e9 08 00 00       	call   dc3 <memset>
  cmd->type = LIST;
     4da:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4dd:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     4e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4e6:	8b 55 08             	mov    0x8(%ebp),%edx
     4e9:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     4ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ef:	8b 55 0c             	mov    0xc(%ebp),%edx
     4f2:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4f8:	c9                   	leave  
     4f9:	c3                   	ret    

000004fa <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4fa:	55                   	push   %ebp
     4fb:	89 e5                	mov    %esp,%ebp
     4fd:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     500:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     507:	e8 e0 0e 00 00       	call   13ec <malloc>
     50c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     50f:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     516:	00 
     517:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     51e:	00 
     51f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     522:	89 04 24             	mov    %eax,(%esp)
     525:	e8 99 08 00 00       	call   dc3 <memset>
  cmd->type = BACK;
     52a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     52d:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     533:	8b 45 f4             	mov    -0xc(%ebp),%eax
     536:	8b 55 08             	mov    0x8(%ebp),%edx
     539:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     53c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     53f:	c9                   	leave  
     540:	c3                   	ret    

00000541 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     541:	55                   	push   %ebp
     542:	89 e5                	mov    %esp,%ebp
     544:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;
  
  s = *ps;
     547:	8b 45 08             	mov    0x8(%ebp),%eax
     54a:	8b 00                	mov    (%eax),%eax
     54c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     54f:	eb 04                	jmp    555 <gettoken+0x14>
    s++;
     551:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     555:	8b 45 f4             	mov    -0xc(%ebp),%eax
     558:	3b 45 0c             	cmp    0xc(%ebp),%eax
     55b:	73 1d                	jae    57a <gettoken+0x39>
     55d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     560:	0f b6 00             	movzbl (%eax),%eax
     563:	0f be c0             	movsbl %al,%eax
     566:	89 44 24 04          	mov    %eax,0x4(%esp)
     56a:	c7 04 24 44 1a 00 00 	movl   $0x1a44,(%esp)
     571:	e8 71 08 00 00       	call   de7 <strchr>
     576:	85 c0                	test   %eax,%eax
     578:	75 d7                	jne    551 <gettoken+0x10>
    s++;
  if(q)
     57a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     57e:	74 08                	je     588 <gettoken+0x47>
    *q = s;
     580:	8b 45 10             	mov    0x10(%ebp),%eax
     583:	8b 55 f4             	mov    -0xc(%ebp),%edx
     586:	89 10                	mov    %edx,(%eax)
  ret = *s;
     588:	8b 45 f4             	mov    -0xc(%ebp),%eax
     58b:	0f b6 00             	movzbl (%eax),%eax
     58e:	0f be c0             	movsbl %al,%eax
     591:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
     594:	8b 45 f4             	mov    -0xc(%ebp),%eax
     597:	0f b6 00             	movzbl (%eax),%eax
     59a:	0f be c0             	movsbl %al,%eax
     59d:	83 f8 29             	cmp    $0x29,%eax
     5a0:	7f 14                	jg     5b6 <gettoken+0x75>
     5a2:	83 f8 28             	cmp    $0x28,%eax
     5a5:	7d 28                	jge    5cf <gettoken+0x8e>
     5a7:	85 c0                	test   %eax,%eax
     5a9:	0f 84 94 00 00 00    	je     643 <gettoken+0x102>
     5af:	83 f8 26             	cmp    $0x26,%eax
     5b2:	74 1b                	je     5cf <gettoken+0x8e>
     5b4:	eb 3c                	jmp    5f2 <gettoken+0xb1>
     5b6:	83 f8 3e             	cmp    $0x3e,%eax
     5b9:	74 1a                	je     5d5 <gettoken+0x94>
     5bb:	83 f8 3e             	cmp    $0x3e,%eax
     5be:	7f 0a                	jg     5ca <gettoken+0x89>
     5c0:	83 e8 3b             	sub    $0x3b,%eax
     5c3:	83 f8 01             	cmp    $0x1,%eax
     5c6:	77 2a                	ja     5f2 <gettoken+0xb1>
     5c8:	eb 05                	jmp    5cf <gettoken+0x8e>
     5ca:	83 f8 7c             	cmp    $0x7c,%eax
     5cd:	75 23                	jne    5f2 <gettoken+0xb1>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     5cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
     5d3:	eb 6f                	jmp    644 <gettoken+0x103>
  case '>':
    s++;
     5d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
     5d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5dc:	0f b6 00             	movzbl (%eax),%eax
     5df:	3c 3e                	cmp    $0x3e,%al
     5e1:	75 0d                	jne    5f0 <gettoken+0xaf>
      ret = '+';
     5e3:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
     5ea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
     5ee:	eb 54                	jmp    644 <gettoken+0x103>
     5f0:	eb 52                	jmp    644 <gettoken+0x103>
  default:
    ret = 'a';
     5f2:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5f9:	eb 04                	jmp    5ff <gettoken+0xbe>
      s++;
     5fb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
     602:	3b 45 0c             	cmp    0xc(%ebp),%eax
     605:	73 3a                	jae    641 <gettoken+0x100>
     607:	8b 45 f4             	mov    -0xc(%ebp),%eax
     60a:	0f b6 00             	movzbl (%eax),%eax
     60d:	0f be c0             	movsbl %al,%eax
     610:	89 44 24 04          	mov    %eax,0x4(%esp)
     614:	c7 04 24 44 1a 00 00 	movl   $0x1a44,(%esp)
     61b:	e8 c7 07 00 00       	call   de7 <strchr>
     620:	85 c0                	test   %eax,%eax
     622:	75 1d                	jne    641 <gettoken+0x100>
     624:	8b 45 f4             	mov    -0xc(%ebp),%eax
     627:	0f b6 00             	movzbl (%eax),%eax
     62a:	0f be c0             	movsbl %al,%eax
     62d:	89 44 24 04          	mov    %eax,0x4(%esp)
     631:	c7 04 24 4a 1a 00 00 	movl   $0x1a4a,(%esp)
     638:	e8 aa 07 00 00       	call   de7 <strchr>
     63d:	85 c0                	test   %eax,%eax
     63f:	74 ba                	je     5fb <gettoken+0xba>
      s++;
    break;
     641:	eb 01                	jmp    644 <gettoken+0x103>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
     643:	90                   	nop
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     644:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     648:	74 0a                	je     654 <gettoken+0x113>
    *eq = s;
     64a:	8b 45 14             	mov    0x14(%ebp),%eax
     64d:	8b 55 f4             	mov    -0xc(%ebp),%edx
     650:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
     652:	eb 06                	jmp    65a <gettoken+0x119>
     654:	eb 04                	jmp    65a <gettoken+0x119>
    s++;
     656:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     65a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     65d:	3b 45 0c             	cmp    0xc(%ebp),%eax
     660:	73 1d                	jae    67f <gettoken+0x13e>
     662:	8b 45 f4             	mov    -0xc(%ebp),%eax
     665:	0f b6 00             	movzbl (%eax),%eax
     668:	0f be c0             	movsbl %al,%eax
     66b:	89 44 24 04          	mov    %eax,0x4(%esp)
     66f:	c7 04 24 44 1a 00 00 	movl   $0x1a44,(%esp)
     676:	e8 6c 07 00 00       	call   de7 <strchr>
     67b:	85 c0                	test   %eax,%eax
     67d:	75 d7                	jne    656 <gettoken+0x115>
    s++;
  *ps = s;
     67f:	8b 45 08             	mov    0x8(%ebp),%eax
     682:	8b 55 f4             	mov    -0xc(%ebp),%edx
     685:	89 10                	mov    %edx,(%eax)
  return ret;
     687:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     68a:	c9                   	leave  
     68b:	c3                   	ret    

0000068c <peek>:

int
peek(char **ps, char *es, char *toks)
{
     68c:	55                   	push   %ebp
     68d:	89 e5                	mov    %esp,%ebp
     68f:	83 ec 28             	sub    $0x28,%esp
  char *s;
  
  s = *ps;
     692:	8b 45 08             	mov    0x8(%ebp),%eax
     695:	8b 00                	mov    (%eax),%eax
     697:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     69a:	eb 04                	jmp    6a0 <peek+0x14>
    s++;
     69c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     6a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6a3:	3b 45 0c             	cmp    0xc(%ebp),%eax
     6a6:	73 1d                	jae    6c5 <peek+0x39>
     6a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6ab:	0f b6 00             	movzbl (%eax),%eax
     6ae:	0f be c0             	movsbl %al,%eax
     6b1:	89 44 24 04          	mov    %eax,0x4(%esp)
     6b5:	c7 04 24 44 1a 00 00 	movl   $0x1a44,(%esp)
     6bc:	e8 26 07 00 00       	call   de7 <strchr>
     6c1:	85 c0                	test   %eax,%eax
     6c3:	75 d7                	jne    69c <peek+0x10>
    s++;
  *ps = s;
     6c5:	8b 45 08             	mov    0x8(%ebp),%eax
     6c8:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6cb:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     6cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6d0:	0f b6 00             	movzbl (%eax),%eax
     6d3:	84 c0                	test   %al,%al
     6d5:	74 23                	je     6fa <peek+0x6e>
     6d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6da:	0f b6 00             	movzbl (%eax),%eax
     6dd:	0f be c0             	movsbl %al,%eax
     6e0:	89 44 24 04          	mov    %eax,0x4(%esp)
     6e4:	8b 45 10             	mov    0x10(%ebp),%eax
     6e7:	89 04 24             	mov    %eax,(%esp)
     6ea:	e8 f8 06 00 00       	call   de7 <strchr>
     6ef:	85 c0                	test   %eax,%eax
     6f1:	74 07                	je     6fa <peek+0x6e>
     6f3:	b8 01 00 00 00       	mov    $0x1,%eax
     6f8:	eb 05                	jmp    6ff <peek+0x73>
     6fa:	b8 00 00 00 00       	mov    $0x0,%eax
}
     6ff:	c9                   	leave  
     700:	c3                   	ret    

00000701 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     701:	55                   	push   %ebp
     702:	89 e5                	mov    %esp,%ebp
     704:	53                   	push   %ebx
     705:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     708:	8b 5d 08             	mov    0x8(%ebp),%ebx
     70b:	8b 45 08             	mov    0x8(%ebp),%eax
     70e:	89 04 24             	mov    %eax,(%esp)
     711:	e8 86 06 00 00       	call   d9c <strlen>
     716:	01 d8                	add    %ebx,%eax
     718:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = parseline(&s, es);
     71b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     71e:	89 44 24 04          	mov    %eax,0x4(%esp)
     722:	8d 45 08             	lea    0x8(%ebp),%eax
     725:	89 04 24             	mov    %eax,(%esp)
     728:	e8 60 00 00 00       	call   78d <parseline>
     72d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  peek(&s, es, "");
     730:	c7 44 24 08 32 15 00 	movl   $0x1532,0x8(%esp)
     737:	00 
     738:	8b 45 f4             	mov    -0xc(%ebp),%eax
     73b:	89 44 24 04          	mov    %eax,0x4(%esp)
     73f:	8d 45 08             	lea    0x8(%ebp),%eax
     742:	89 04 24             	mov    %eax,(%esp)
     745:	e8 42 ff ff ff       	call   68c <peek>
  if(s != es){
     74a:	8b 45 08             	mov    0x8(%ebp),%eax
     74d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     750:	74 27                	je     779 <parsecmd+0x78>
    printf(2, "leftovers: %s\n", s);
     752:	8b 45 08             	mov    0x8(%ebp),%eax
     755:	89 44 24 08          	mov    %eax,0x8(%esp)
     759:	c7 44 24 04 33 15 00 	movl   $0x1533,0x4(%esp)
     760:	00 
     761:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     768:	e8 93 09 00 00       	call   1100 <printf>
    panic("syntax");
     76d:	c7 04 24 42 15 00 00 	movl   $0x1542,(%esp)
     774:	e8 de fb ff ff       	call   357 <panic>
  }
  nulterminate(cmd);
     779:	8b 45 f0             	mov    -0x10(%ebp),%eax
     77c:	89 04 24             	mov    %eax,(%esp)
     77f:	e8 a3 04 00 00       	call   c27 <nulterminate>
  return cmd;
     784:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     787:	83 c4 24             	add    $0x24,%esp
     78a:	5b                   	pop    %ebx
     78b:	5d                   	pop    %ebp
     78c:	c3                   	ret    

0000078d <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     78d:	55                   	push   %ebp
     78e:	89 e5                	mov    %esp,%ebp
     790:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     793:	8b 45 0c             	mov    0xc(%ebp),%eax
     796:	89 44 24 04          	mov    %eax,0x4(%esp)
     79a:	8b 45 08             	mov    0x8(%ebp),%eax
     79d:	89 04 24             	mov    %eax,(%esp)
     7a0:	e8 bc 00 00 00       	call   861 <parsepipe>
     7a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     7a8:	eb 30                	jmp    7da <parseline+0x4d>
    gettoken(ps, es, 0, 0);
     7aa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     7b1:	00 
     7b2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7b9:	00 
     7ba:	8b 45 0c             	mov    0xc(%ebp),%eax
     7bd:	89 44 24 04          	mov    %eax,0x4(%esp)
     7c1:	8b 45 08             	mov    0x8(%ebp),%eax
     7c4:	89 04 24             	mov    %eax,(%esp)
     7c7:	e8 75 fd ff ff       	call   541 <gettoken>
    cmd = backcmd(cmd);
     7cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7cf:	89 04 24             	mov    %eax,(%esp)
     7d2:	e8 23 fd ff ff       	call   4fa <backcmd>
     7d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     7da:	c7 44 24 08 49 15 00 	movl   $0x1549,0x8(%esp)
     7e1:	00 
     7e2:	8b 45 0c             	mov    0xc(%ebp),%eax
     7e5:	89 44 24 04          	mov    %eax,0x4(%esp)
     7e9:	8b 45 08             	mov    0x8(%ebp),%eax
     7ec:	89 04 24             	mov    %eax,(%esp)
     7ef:	e8 98 fe ff ff       	call   68c <peek>
     7f4:	85 c0                	test   %eax,%eax
     7f6:	75 b2                	jne    7aa <parseline+0x1d>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     7f8:	c7 44 24 08 4b 15 00 	movl   $0x154b,0x8(%esp)
     7ff:	00 
     800:	8b 45 0c             	mov    0xc(%ebp),%eax
     803:	89 44 24 04          	mov    %eax,0x4(%esp)
     807:	8b 45 08             	mov    0x8(%ebp),%eax
     80a:	89 04 24             	mov    %eax,(%esp)
     80d:	e8 7a fe ff ff       	call   68c <peek>
     812:	85 c0                	test   %eax,%eax
     814:	74 46                	je     85c <parseline+0xcf>
    gettoken(ps, es, 0, 0);
     816:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     81d:	00 
     81e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     825:	00 
     826:	8b 45 0c             	mov    0xc(%ebp),%eax
     829:	89 44 24 04          	mov    %eax,0x4(%esp)
     82d:	8b 45 08             	mov    0x8(%ebp),%eax
     830:	89 04 24             	mov    %eax,(%esp)
     833:	e8 09 fd ff ff       	call   541 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     838:	8b 45 0c             	mov    0xc(%ebp),%eax
     83b:	89 44 24 04          	mov    %eax,0x4(%esp)
     83f:	8b 45 08             	mov    0x8(%ebp),%eax
     842:	89 04 24             	mov    %eax,(%esp)
     845:	e8 43 ff ff ff       	call   78d <parseline>
     84a:	89 44 24 04          	mov    %eax,0x4(%esp)
     84e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     851:	89 04 24             	mov    %eax,(%esp)
     854:	e8 51 fc ff ff       	call   4aa <listcmd>
     859:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     85c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     85f:	c9                   	leave  
     860:	c3                   	ret    

00000861 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     861:	55                   	push   %ebp
     862:	89 e5                	mov    %esp,%ebp
     864:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     867:	8b 45 0c             	mov    0xc(%ebp),%eax
     86a:	89 44 24 04          	mov    %eax,0x4(%esp)
     86e:	8b 45 08             	mov    0x8(%ebp),%eax
     871:	89 04 24             	mov    %eax,(%esp)
     874:	e8 68 02 00 00       	call   ae1 <parseexec>
     879:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     87c:	c7 44 24 08 4d 15 00 	movl   $0x154d,0x8(%esp)
     883:	00 
     884:	8b 45 0c             	mov    0xc(%ebp),%eax
     887:	89 44 24 04          	mov    %eax,0x4(%esp)
     88b:	8b 45 08             	mov    0x8(%ebp),%eax
     88e:	89 04 24             	mov    %eax,(%esp)
     891:	e8 f6 fd ff ff       	call   68c <peek>
     896:	85 c0                	test   %eax,%eax
     898:	74 46                	je     8e0 <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
     89a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8a1:	00 
     8a2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8a9:	00 
     8aa:	8b 45 0c             	mov    0xc(%ebp),%eax
     8ad:	89 44 24 04          	mov    %eax,0x4(%esp)
     8b1:	8b 45 08             	mov    0x8(%ebp),%eax
     8b4:	89 04 24             	mov    %eax,(%esp)
     8b7:	e8 85 fc ff ff       	call   541 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8bc:	8b 45 0c             	mov    0xc(%ebp),%eax
     8bf:	89 44 24 04          	mov    %eax,0x4(%esp)
     8c3:	8b 45 08             	mov    0x8(%ebp),%eax
     8c6:	89 04 24             	mov    %eax,(%esp)
     8c9:	e8 93 ff ff ff       	call   861 <parsepipe>
     8ce:	89 44 24 04          	mov    %eax,0x4(%esp)
     8d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8d5:	89 04 24             	mov    %eax,(%esp)
     8d8:	e8 7d fb ff ff       	call   45a <pipecmd>
     8dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     8e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     8e3:	c9                   	leave  
     8e4:	c3                   	ret    

000008e5 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     8e5:	55                   	push   %ebp
     8e6:	89 e5                	mov    %esp,%ebp
     8e8:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     8eb:	e9 f6 00 00 00       	jmp    9e6 <parseredirs+0x101>
    tok = gettoken(ps, es, 0, 0);
     8f0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8f7:	00 
     8f8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8ff:	00 
     900:	8b 45 10             	mov    0x10(%ebp),%eax
     903:	89 44 24 04          	mov    %eax,0x4(%esp)
     907:	8b 45 0c             	mov    0xc(%ebp),%eax
     90a:	89 04 24             	mov    %eax,(%esp)
     90d:	e8 2f fc ff ff       	call   541 <gettoken>
     912:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     915:	8d 45 ec             	lea    -0x14(%ebp),%eax
     918:	89 44 24 0c          	mov    %eax,0xc(%esp)
     91c:	8d 45 f0             	lea    -0x10(%ebp),%eax
     91f:	89 44 24 08          	mov    %eax,0x8(%esp)
     923:	8b 45 10             	mov    0x10(%ebp),%eax
     926:	89 44 24 04          	mov    %eax,0x4(%esp)
     92a:	8b 45 0c             	mov    0xc(%ebp),%eax
     92d:	89 04 24             	mov    %eax,(%esp)
     930:	e8 0c fc ff ff       	call   541 <gettoken>
     935:	83 f8 61             	cmp    $0x61,%eax
     938:	74 0c                	je     946 <parseredirs+0x61>
      panic("missing file for redirection");
     93a:	c7 04 24 4f 15 00 00 	movl   $0x154f,(%esp)
     941:	e8 11 fa ff ff       	call   357 <panic>
    switch(tok){
     946:	8b 45 f4             	mov    -0xc(%ebp),%eax
     949:	83 f8 3c             	cmp    $0x3c,%eax
     94c:	74 0f                	je     95d <parseredirs+0x78>
     94e:	83 f8 3e             	cmp    $0x3e,%eax
     951:	74 38                	je     98b <parseredirs+0xa6>
     953:	83 f8 2b             	cmp    $0x2b,%eax
     956:	74 61                	je     9b9 <parseredirs+0xd4>
     958:	e9 89 00 00 00       	jmp    9e6 <parseredirs+0x101>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     95d:	8b 55 ec             	mov    -0x14(%ebp),%edx
     960:	8b 45 f0             	mov    -0x10(%ebp),%eax
     963:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     96a:	00 
     96b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     972:	00 
     973:	89 54 24 08          	mov    %edx,0x8(%esp)
     977:	89 44 24 04          	mov    %eax,0x4(%esp)
     97b:	8b 45 08             	mov    0x8(%ebp),%eax
     97e:	89 04 24             	mov    %eax,(%esp)
     981:	e8 69 fa ff ff       	call   3ef <redircmd>
     986:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     989:	eb 5b                	jmp    9e6 <parseredirs+0x101>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     98b:	8b 55 ec             	mov    -0x14(%ebp),%edx
     98e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     991:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     998:	00 
     999:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     9a0:	00 
     9a1:	89 54 24 08          	mov    %edx,0x8(%esp)
     9a5:	89 44 24 04          	mov    %eax,0x4(%esp)
     9a9:	8b 45 08             	mov    0x8(%ebp),%eax
     9ac:	89 04 24             	mov    %eax,(%esp)
     9af:	e8 3b fa ff ff       	call   3ef <redircmd>
     9b4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9b7:	eb 2d                	jmp    9e6 <parseredirs+0x101>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9b9:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9bf:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9c6:	00 
     9c7:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     9ce:	00 
     9cf:	89 54 24 08          	mov    %edx,0x8(%esp)
     9d3:	89 44 24 04          	mov    %eax,0x4(%esp)
     9d7:	8b 45 08             	mov    0x8(%ebp),%eax
     9da:	89 04 24             	mov    %eax,(%esp)
     9dd:	e8 0d fa ff ff       	call   3ef <redircmd>
     9e2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9e5:	90                   	nop
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     9e6:	c7 44 24 08 6c 15 00 	movl   $0x156c,0x8(%esp)
     9ed:	00 
     9ee:	8b 45 10             	mov    0x10(%ebp),%eax
     9f1:	89 44 24 04          	mov    %eax,0x4(%esp)
     9f5:	8b 45 0c             	mov    0xc(%ebp),%eax
     9f8:	89 04 24             	mov    %eax,(%esp)
     9fb:	e8 8c fc ff ff       	call   68c <peek>
     a00:	85 c0                	test   %eax,%eax
     a02:	0f 85 e8 fe ff ff    	jne    8f0 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
     a08:	8b 45 08             	mov    0x8(%ebp),%eax
}
     a0b:	c9                   	leave  
     a0c:	c3                   	ret    

00000a0d <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     a0d:	55                   	push   %ebp
     a0e:	89 e5                	mov    %esp,%ebp
     a10:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     a13:	c7 44 24 08 6f 15 00 	movl   $0x156f,0x8(%esp)
     a1a:	00 
     a1b:	8b 45 0c             	mov    0xc(%ebp),%eax
     a1e:	89 44 24 04          	mov    %eax,0x4(%esp)
     a22:	8b 45 08             	mov    0x8(%ebp),%eax
     a25:	89 04 24             	mov    %eax,(%esp)
     a28:	e8 5f fc ff ff       	call   68c <peek>
     a2d:	85 c0                	test   %eax,%eax
     a2f:	75 0c                	jne    a3d <parseblock+0x30>
    panic("parseblock");
     a31:	c7 04 24 71 15 00 00 	movl   $0x1571,(%esp)
     a38:	e8 1a f9 ff ff       	call   357 <panic>
  gettoken(ps, es, 0, 0);
     a3d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a44:	00 
     a45:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a4c:	00 
     a4d:	8b 45 0c             	mov    0xc(%ebp),%eax
     a50:	89 44 24 04          	mov    %eax,0x4(%esp)
     a54:	8b 45 08             	mov    0x8(%ebp),%eax
     a57:	89 04 24             	mov    %eax,(%esp)
     a5a:	e8 e2 fa ff ff       	call   541 <gettoken>
  cmd = parseline(ps, es);
     a5f:	8b 45 0c             	mov    0xc(%ebp),%eax
     a62:	89 44 24 04          	mov    %eax,0x4(%esp)
     a66:	8b 45 08             	mov    0x8(%ebp),%eax
     a69:	89 04 24             	mov    %eax,(%esp)
     a6c:	e8 1c fd ff ff       	call   78d <parseline>
     a71:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     a74:	c7 44 24 08 7c 15 00 	movl   $0x157c,0x8(%esp)
     a7b:	00 
     a7c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a7f:	89 44 24 04          	mov    %eax,0x4(%esp)
     a83:	8b 45 08             	mov    0x8(%ebp),%eax
     a86:	89 04 24             	mov    %eax,(%esp)
     a89:	e8 fe fb ff ff       	call   68c <peek>
     a8e:	85 c0                	test   %eax,%eax
     a90:	75 0c                	jne    a9e <parseblock+0x91>
    panic("syntax - missing )");
     a92:	c7 04 24 7e 15 00 00 	movl   $0x157e,(%esp)
     a99:	e8 b9 f8 ff ff       	call   357 <panic>
  gettoken(ps, es, 0, 0);
     a9e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     aa5:	00 
     aa6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     aad:	00 
     aae:	8b 45 0c             	mov    0xc(%ebp),%eax
     ab1:	89 44 24 04          	mov    %eax,0x4(%esp)
     ab5:	8b 45 08             	mov    0x8(%ebp),%eax
     ab8:	89 04 24             	mov    %eax,(%esp)
     abb:	e8 81 fa ff ff       	call   541 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ac0:	8b 45 0c             	mov    0xc(%ebp),%eax
     ac3:	89 44 24 08          	mov    %eax,0x8(%esp)
     ac7:	8b 45 08             	mov    0x8(%ebp),%eax
     aca:	89 44 24 04          	mov    %eax,0x4(%esp)
     ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ad1:	89 04 24             	mov    %eax,(%esp)
     ad4:	e8 0c fe ff ff       	call   8e5 <parseredirs>
     ad9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     adc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     adf:	c9                   	leave  
     ae0:	c3                   	ret    

00000ae1 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     ae1:	55                   	push   %ebp
     ae2:	89 e5                	mov    %esp,%ebp
     ae4:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     ae7:	c7 44 24 08 6f 15 00 	movl   $0x156f,0x8(%esp)
     aee:	00 
     aef:	8b 45 0c             	mov    0xc(%ebp),%eax
     af2:	89 44 24 04          	mov    %eax,0x4(%esp)
     af6:	8b 45 08             	mov    0x8(%ebp),%eax
     af9:	89 04 24             	mov    %eax,(%esp)
     afc:	e8 8b fb ff ff       	call   68c <peek>
     b01:	85 c0                	test   %eax,%eax
     b03:	74 17                	je     b1c <parseexec+0x3b>
    return parseblock(ps, es);
     b05:	8b 45 0c             	mov    0xc(%ebp),%eax
     b08:	89 44 24 04          	mov    %eax,0x4(%esp)
     b0c:	8b 45 08             	mov    0x8(%ebp),%eax
     b0f:	89 04 24             	mov    %eax,(%esp)
     b12:	e8 f6 fe ff ff       	call   a0d <parseblock>
     b17:	e9 09 01 00 00       	jmp    c25 <parseexec+0x144>

  ret = execcmd();
     b1c:	e8 90 f8 ff ff       	call   3b1 <execcmd>
     b21:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
     b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b27:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
     b2a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
     b31:	8b 45 0c             	mov    0xc(%ebp),%eax
     b34:	89 44 24 08          	mov    %eax,0x8(%esp)
     b38:	8b 45 08             	mov    0x8(%ebp),%eax
     b3b:	89 44 24 04          	mov    %eax,0x4(%esp)
     b3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b42:	89 04 24             	mov    %eax,(%esp)
     b45:	e8 9b fd ff ff       	call   8e5 <parseredirs>
     b4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     b4d:	e9 8f 00 00 00       	jmp    be1 <parseexec+0x100>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b52:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b55:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b59:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b5c:	89 44 24 08          	mov    %eax,0x8(%esp)
     b60:	8b 45 0c             	mov    0xc(%ebp),%eax
     b63:	89 44 24 04          	mov    %eax,0x4(%esp)
     b67:	8b 45 08             	mov    0x8(%ebp),%eax
     b6a:	89 04 24             	mov    %eax,(%esp)
     b6d:	e8 cf f9 ff ff       	call   541 <gettoken>
     b72:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b75:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     b79:	75 05                	jne    b80 <parseexec+0x9f>
      break;
     b7b:	e9 83 00 00 00       	jmp    c03 <parseexec+0x122>
    if(tok != 'a')
     b80:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     b84:	74 0c                	je     b92 <parseexec+0xb1>
      panic("syntax");
     b86:	c7 04 24 42 15 00 00 	movl   $0x1542,(%esp)
     b8d:	e8 c5 f7 ff ff       	call   357 <panic>
    cmd->argv[argc] = q;
     b92:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     b95:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b98:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b9b:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     b9f:	8b 55 e0             	mov    -0x20(%ebp),%edx
     ba2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     ba5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     ba8:	83 c1 08             	add    $0x8,%ecx
     bab:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     baf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= MAXARGS)
     bb3:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
     bb7:	7e 0c                	jle    bc5 <parseexec+0xe4>
      panic("too many args");
     bb9:	c7 04 24 91 15 00 00 	movl   $0x1591,(%esp)
     bc0:	e8 92 f7 ff ff       	call   357 <panic>
    ret = parseredirs(ret, ps, es);
     bc5:	8b 45 0c             	mov    0xc(%ebp),%eax
     bc8:	89 44 24 08          	mov    %eax,0x8(%esp)
     bcc:	8b 45 08             	mov    0x8(%ebp),%eax
     bcf:	89 44 24 04          	mov    %eax,0x4(%esp)
     bd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bd6:	89 04 24             	mov    %eax,(%esp)
     bd9:	e8 07 fd ff ff       	call   8e5 <parseredirs>
     bde:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     be1:	c7 44 24 08 9f 15 00 	movl   $0x159f,0x8(%esp)
     be8:	00 
     be9:	8b 45 0c             	mov    0xc(%ebp),%eax
     bec:	89 44 24 04          	mov    %eax,0x4(%esp)
     bf0:	8b 45 08             	mov    0x8(%ebp),%eax
     bf3:	89 04 24             	mov    %eax,(%esp)
     bf6:	e8 91 fa ff ff       	call   68c <peek>
     bfb:	85 c0                	test   %eax,%eax
     bfd:	0f 84 4f ff ff ff    	je     b52 <parseexec+0x71>
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     c03:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c06:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c09:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     c10:	00 
  cmd->eargv[argc] = 0;
     c11:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c14:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c17:	83 c2 08             	add    $0x8,%edx
     c1a:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     c21:	00 
  return ret;
     c22:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     c25:	c9                   	leave  
     c26:	c3                   	ret    

00000c27 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c27:	55                   	push   %ebp
     c28:	89 e5                	mov    %esp,%ebp
     c2a:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c2d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c31:	75 0a                	jne    c3d <nulterminate+0x16>
    return 0;
     c33:	b8 00 00 00 00       	mov    $0x0,%eax
     c38:	e9 c9 00 00 00       	jmp    d06 <nulterminate+0xdf>
  
  switch(cmd->type){
     c3d:	8b 45 08             	mov    0x8(%ebp),%eax
     c40:	8b 00                	mov    (%eax),%eax
     c42:	83 f8 05             	cmp    $0x5,%eax
     c45:	0f 87 b8 00 00 00    	ja     d03 <nulterminate+0xdc>
     c4b:	8b 04 85 a4 15 00 00 	mov    0x15a4(,%eax,4),%eax
     c52:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     c54:	8b 45 08             	mov    0x8(%ebp),%eax
     c57:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     c5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c61:	eb 14                	jmp    c77 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     c63:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c66:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c69:	83 c2 08             	add    $0x8,%edx
     c6c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     c70:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     c73:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c77:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c7a:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c7d:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     c81:	85 c0                	test   %eax,%eax
     c83:	75 de                	jne    c63 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
     c85:	eb 7c                	jmp    d03 <nulterminate+0xdc>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     c87:	8b 45 08             	mov    0x8(%ebp),%eax
     c8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
     c8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c90:	8b 40 04             	mov    0x4(%eax),%eax
     c93:	89 04 24             	mov    %eax,(%esp)
     c96:	e8 8c ff ff ff       	call   c27 <nulterminate>
    *rcmd->efile = 0;
     c9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c9e:	8b 40 0c             	mov    0xc(%eax),%eax
     ca1:	c6 00 00             	movb   $0x0,(%eax)
    break;
     ca4:	eb 5d                	jmp    d03 <nulterminate+0xdc>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     ca6:	8b 45 08             	mov    0x8(%ebp),%eax
     ca9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
     cac:	8b 45 e8             	mov    -0x18(%ebp),%eax
     caf:	8b 40 04             	mov    0x4(%eax),%eax
     cb2:	89 04 24             	mov    %eax,(%esp)
     cb5:	e8 6d ff ff ff       	call   c27 <nulterminate>
    nulterminate(pcmd->right);
     cba:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cbd:	8b 40 08             	mov    0x8(%eax),%eax
     cc0:	89 04 24             	mov    %eax,(%esp)
     cc3:	e8 5f ff ff ff       	call   c27 <nulterminate>
    break;
     cc8:	eb 39                	jmp    d03 <nulterminate+0xdc>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
     cca:	8b 45 08             	mov    0x8(%ebp),%eax
     ccd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
     cd0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cd3:	8b 40 04             	mov    0x4(%eax),%eax
     cd6:	89 04 24             	mov    %eax,(%esp)
     cd9:	e8 49 ff ff ff       	call   c27 <nulterminate>
    nulterminate(lcmd->right);
     cde:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ce1:	8b 40 08             	mov    0x8(%eax),%eax
     ce4:	89 04 24             	mov    %eax,(%esp)
     ce7:	e8 3b ff ff ff       	call   c27 <nulterminate>
    break;
     cec:	eb 15                	jmp    d03 <nulterminate+0xdc>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     cee:	8b 45 08             	mov    0x8(%ebp),%eax
     cf1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
     cf4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     cf7:	8b 40 04             	mov    0x4(%eax),%eax
     cfa:	89 04 24             	mov    %eax,(%esp)
     cfd:	e8 25 ff ff ff       	call   c27 <nulterminate>
    break;
     d02:	90                   	nop
  }
  return cmd;
     d03:	8b 45 08             	mov    0x8(%ebp),%eax
}
     d06:	c9                   	leave  
     d07:	c3                   	ret    

00000d08 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     d08:	55                   	push   %ebp
     d09:	89 e5                	mov    %esp,%ebp
     d0b:	57                   	push   %edi
     d0c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     d0d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d10:	8b 55 10             	mov    0x10(%ebp),%edx
     d13:	8b 45 0c             	mov    0xc(%ebp),%eax
     d16:	89 cb                	mov    %ecx,%ebx
     d18:	89 df                	mov    %ebx,%edi
     d1a:	89 d1                	mov    %edx,%ecx
     d1c:	fc                   	cld    
     d1d:	f3 aa                	rep stos %al,%es:(%edi)
     d1f:	89 ca                	mov    %ecx,%edx
     d21:	89 fb                	mov    %edi,%ebx
     d23:	89 5d 08             	mov    %ebx,0x8(%ebp)
     d26:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     d29:	5b                   	pop    %ebx
     d2a:	5f                   	pop    %edi
     d2b:	5d                   	pop    %ebp
     d2c:	c3                   	ret    

00000d2d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     d2d:	55                   	push   %ebp
     d2e:	89 e5                	mov    %esp,%ebp
     d30:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     d33:	8b 45 08             	mov    0x8(%ebp),%eax
     d36:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     d39:	90                   	nop
     d3a:	8b 45 08             	mov    0x8(%ebp),%eax
     d3d:	8d 50 01             	lea    0x1(%eax),%edx
     d40:	89 55 08             	mov    %edx,0x8(%ebp)
     d43:	8b 55 0c             	mov    0xc(%ebp),%edx
     d46:	8d 4a 01             	lea    0x1(%edx),%ecx
     d49:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     d4c:	0f b6 12             	movzbl (%edx),%edx
     d4f:	88 10                	mov    %dl,(%eax)
     d51:	0f b6 00             	movzbl (%eax),%eax
     d54:	84 c0                	test   %al,%al
     d56:	75 e2                	jne    d3a <strcpy+0xd>
    ;
  return os;
     d58:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     d5b:	c9                   	leave  
     d5c:	c3                   	ret    

00000d5d <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d5d:	55                   	push   %ebp
     d5e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     d60:	eb 08                	jmp    d6a <strcmp+0xd>
    p++, q++;
     d62:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d66:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     d6a:	8b 45 08             	mov    0x8(%ebp),%eax
     d6d:	0f b6 00             	movzbl (%eax),%eax
     d70:	84 c0                	test   %al,%al
     d72:	74 10                	je     d84 <strcmp+0x27>
     d74:	8b 45 08             	mov    0x8(%ebp),%eax
     d77:	0f b6 10             	movzbl (%eax),%edx
     d7a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d7d:	0f b6 00             	movzbl (%eax),%eax
     d80:	38 c2                	cmp    %al,%dl
     d82:	74 de                	je     d62 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     d84:	8b 45 08             	mov    0x8(%ebp),%eax
     d87:	0f b6 00             	movzbl (%eax),%eax
     d8a:	0f b6 d0             	movzbl %al,%edx
     d8d:	8b 45 0c             	mov    0xc(%ebp),%eax
     d90:	0f b6 00             	movzbl (%eax),%eax
     d93:	0f b6 c0             	movzbl %al,%eax
     d96:	29 c2                	sub    %eax,%edx
     d98:	89 d0                	mov    %edx,%eax
}
     d9a:	5d                   	pop    %ebp
     d9b:	c3                   	ret    

00000d9c <strlen>:

uint
strlen(char *s)
{
     d9c:	55                   	push   %ebp
     d9d:	89 e5                	mov    %esp,%ebp
     d9f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     da2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     da9:	eb 04                	jmp    daf <strlen+0x13>
     dab:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     daf:	8b 55 fc             	mov    -0x4(%ebp),%edx
     db2:	8b 45 08             	mov    0x8(%ebp),%eax
     db5:	01 d0                	add    %edx,%eax
     db7:	0f b6 00             	movzbl (%eax),%eax
     dba:	84 c0                	test   %al,%al
     dbc:	75 ed                	jne    dab <strlen+0xf>
    ;
  return n;
     dbe:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     dc1:	c9                   	leave  
     dc2:	c3                   	ret    

00000dc3 <memset>:

void*
memset(void *dst, int c, uint n)
{
     dc3:	55                   	push   %ebp
     dc4:	89 e5                	mov    %esp,%ebp
     dc6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     dc9:	8b 45 10             	mov    0x10(%ebp),%eax
     dcc:	89 44 24 08          	mov    %eax,0x8(%esp)
     dd0:	8b 45 0c             	mov    0xc(%ebp),%eax
     dd3:	89 44 24 04          	mov    %eax,0x4(%esp)
     dd7:	8b 45 08             	mov    0x8(%ebp),%eax
     dda:	89 04 24             	mov    %eax,(%esp)
     ddd:	e8 26 ff ff ff       	call   d08 <stosb>
  return dst;
     de2:	8b 45 08             	mov    0x8(%ebp),%eax
}
     de5:	c9                   	leave  
     de6:	c3                   	ret    

00000de7 <strchr>:

char*
strchr(const char *s, char c)
{
     de7:	55                   	push   %ebp
     de8:	89 e5                	mov    %esp,%ebp
     dea:	83 ec 04             	sub    $0x4,%esp
     ded:	8b 45 0c             	mov    0xc(%ebp),%eax
     df0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     df3:	eb 14                	jmp    e09 <strchr+0x22>
    if(*s == c)
     df5:	8b 45 08             	mov    0x8(%ebp),%eax
     df8:	0f b6 00             	movzbl (%eax),%eax
     dfb:	3a 45 fc             	cmp    -0x4(%ebp),%al
     dfe:	75 05                	jne    e05 <strchr+0x1e>
      return (char*)s;
     e00:	8b 45 08             	mov    0x8(%ebp),%eax
     e03:	eb 13                	jmp    e18 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     e05:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     e09:	8b 45 08             	mov    0x8(%ebp),%eax
     e0c:	0f b6 00             	movzbl (%eax),%eax
     e0f:	84 c0                	test   %al,%al
     e11:	75 e2                	jne    df5 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     e13:	b8 00 00 00 00       	mov    $0x0,%eax
}
     e18:	c9                   	leave  
     e19:	c3                   	ret    

00000e1a <gets>:

char*
gets(char *buf, int max)
{
     e1a:	55                   	push   %ebp
     e1b:	89 e5                	mov    %esp,%ebp
     e1d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e20:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e27:	eb 4c                	jmp    e75 <gets+0x5b>
    cc = read(0, &c, 1);
     e29:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e30:	00 
     e31:	8d 45 ef             	lea    -0x11(%ebp),%eax
     e34:	89 44 24 04          	mov    %eax,0x4(%esp)
     e38:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e3f:	e8 44 01 00 00       	call   f88 <read>
     e44:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     e47:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     e4b:	7f 02                	jg     e4f <gets+0x35>
      break;
     e4d:	eb 31                	jmp    e80 <gets+0x66>
    buf[i++] = c;
     e4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e52:	8d 50 01             	lea    0x1(%eax),%edx
     e55:	89 55 f4             	mov    %edx,-0xc(%ebp)
     e58:	89 c2                	mov    %eax,%edx
     e5a:	8b 45 08             	mov    0x8(%ebp),%eax
     e5d:	01 c2                	add    %eax,%edx
     e5f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e63:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     e65:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e69:	3c 0a                	cmp    $0xa,%al
     e6b:	74 13                	je     e80 <gets+0x66>
     e6d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e71:	3c 0d                	cmp    $0xd,%al
     e73:	74 0b                	je     e80 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e75:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e78:	83 c0 01             	add    $0x1,%eax
     e7b:	3b 45 0c             	cmp    0xc(%ebp),%eax
     e7e:	7c a9                	jl     e29 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     e80:	8b 55 f4             	mov    -0xc(%ebp),%edx
     e83:	8b 45 08             	mov    0x8(%ebp),%eax
     e86:	01 d0                	add    %edx,%eax
     e88:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     e8b:	8b 45 08             	mov    0x8(%ebp),%eax
}
     e8e:	c9                   	leave  
     e8f:	c3                   	ret    

00000e90 <stat>:

int
stat(char *n, struct stat *st)
{
     e90:	55                   	push   %ebp
     e91:	89 e5                	mov    %esp,%ebp
     e93:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e96:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     e9d:	00 
     e9e:	8b 45 08             	mov    0x8(%ebp),%eax
     ea1:	89 04 24             	mov    %eax,(%esp)
     ea4:	e8 07 01 00 00       	call   fb0 <open>
     ea9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     eac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     eb0:	79 07                	jns    eb9 <stat+0x29>
    return -1;
     eb2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     eb7:	eb 23                	jmp    edc <stat+0x4c>
  r = fstat(fd, st);
     eb9:	8b 45 0c             	mov    0xc(%ebp),%eax
     ebc:	89 44 24 04          	mov    %eax,0x4(%esp)
     ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ec3:	89 04 24             	mov    %eax,(%esp)
     ec6:	e8 fd 00 00 00       	call   fc8 <fstat>
     ecb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     ece:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ed1:	89 04 24             	mov    %eax,(%esp)
     ed4:	e8 bf 00 00 00       	call   f98 <close>
  return r;
     ed9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     edc:	c9                   	leave  
     edd:	c3                   	ret    

00000ede <atoi>:

int
atoi(const char *s)
{
     ede:	55                   	push   %ebp
     edf:	89 e5                	mov    %esp,%ebp
     ee1:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     ee4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     eeb:	eb 25                	jmp    f12 <atoi+0x34>
    n = n*10 + *s++ - '0';
     eed:	8b 55 fc             	mov    -0x4(%ebp),%edx
     ef0:	89 d0                	mov    %edx,%eax
     ef2:	c1 e0 02             	shl    $0x2,%eax
     ef5:	01 d0                	add    %edx,%eax
     ef7:	01 c0                	add    %eax,%eax
     ef9:	89 c1                	mov    %eax,%ecx
     efb:	8b 45 08             	mov    0x8(%ebp),%eax
     efe:	8d 50 01             	lea    0x1(%eax),%edx
     f01:	89 55 08             	mov    %edx,0x8(%ebp)
     f04:	0f b6 00             	movzbl (%eax),%eax
     f07:	0f be c0             	movsbl %al,%eax
     f0a:	01 c8                	add    %ecx,%eax
     f0c:	83 e8 30             	sub    $0x30,%eax
     f0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f12:	8b 45 08             	mov    0x8(%ebp),%eax
     f15:	0f b6 00             	movzbl (%eax),%eax
     f18:	3c 2f                	cmp    $0x2f,%al
     f1a:	7e 0a                	jle    f26 <atoi+0x48>
     f1c:	8b 45 08             	mov    0x8(%ebp),%eax
     f1f:	0f b6 00             	movzbl (%eax),%eax
     f22:	3c 39                	cmp    $0x39,%al
     f24:	7e c7                	jle    eed <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     f26:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f29:	c9                   	leave  
     f2a:	c3                   	ret    

00000f2b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     f2b:	55                   	push   %ebp
     f2c:	89 e5                	mov    %esp,%ebp
     f2e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     f31:	8b 45 08             	mov    0x8(%ebp),%eax
     f34:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     f37:	8b 45 0c             	mov    0xc(%ebp),%eax
     f3a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     f3d:	eb 17                	jmp    f56 <memmove+0x2b>
    *dst++ = *src++;
     f3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f42:	8d 50 01             	lea    0x1(%eax),%edx
     f45:	89 55 fc             	mov    %edx,-0x4(%ebp)
     f48:	8b 55 f8             	mov    -0x8(%ebp),%edx
     f4b:	8d 4a 01             	lea    0x1(%edx),%ecx
     f4e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     f51:	0f b6 12             	movzbl (%edx),%edx
     f54:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f56:	8b 45 10             	mov    0x10(%ebp),%eax
     f59:	8d 50 ff             	lea    -0x1(%eax),%edx
     f5c:	89 55 10             	mov    %edx,0x10(%ebp)
     f5f:	85 c0                	test   %eax,%eax
     f61:	7f dc                	jg     f3f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     f63:	8b 45 08             	mov    0x8(%ebp),%eax
}
     f66:	c9                   	leave  
     f67:	c3                   	ret    

00000f68 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f68:	b8 01 00 00 00       	mov    $0x1,%eax
     f6d:	cd 40                	int    $0x40
     f6f:	c3                   	ret    

00000f70 <exit>:
SYSCALL(exit)
     f70:	b8 02 00 00 00       	mov    $0x2,%eax
     f75:	cd 40                	int    $0x40
     f77:	c3                   	ret    

00000f78 <wait>:
SYSCALL(wait)
     f78:	b8 03 00 00 00       	mov    $0x3,%eax
     f7d:	cd 40                	int    $0x40
     f7f:	c3                   	ret    

00000f80 <pipe>:
SYSCALL(pipe)
     f80:	b8 04 00 00 00       	mov    $0x4,%eax
     f85:	cd 40                	int    $0x40
     f87:	c3                   	ret    

00000f88 <read>:
SYSCALL(read)
     f88:	b8 05 00 00 00       	mov    $0x5,%eax
     f8d:	cd 40                	int    $0x40
     f8f:	c3                   	ret    

00000f90 <write>:
SYSCALL(write)
     f90:	b8 10 00 00 00       	mov    $0x10,%eax
     f95:	cd 40                	int    $0x40
     f97:	c3                   	ret    

00000f98 <close>:
SYSCALL(close)
     f98:	b8 15 00 00 00       	mov    $0x15,%eax
     f9d:	cd 40                	int    $0x40
     f9f:	c3                   	ret    

00000fa0 <kill>:
SYSCALL(kill)
     fa0:	b8 06 00 00 00       	mov    $0x6,%eax
     fa5:	cd 40                	int    $0x40
     fa7:	c3                   	ret    

00000fa8 <exec>:
SYSCALL(exec)
     fa8:	b8 07 00 00 00       	mov    $0x7,%eax
     fad:	cd 40                	int    $0x40
     faf:	c3                   	ret    

00000fb0 <open>:
SYSCALL(open)
     fb0:	b8 0f 00 00 00       	mov    $0xf,%eax
     fb5:	cd 40                	int    $0x40
     fb7:	c3                   	ret    

00000fb8 <mknod>:
SYSCALL(mknod)
     fb8:	b8 11 00 00 00       	mov    $0x11,%eax
     fbd:	cd 40                	int    $0x40
     fbf:	c3                   	ret    

00000fc0 <unlink>:
SYSCALL(unlink)
     fc0:	b8 12 00 00 00       	mov    $0x12,%eax
     fc5:	cd 40                	int    $0x40
     fc7:	c3                   	ret    

00000fc8 <fstat>:
SYSCALL(fstat)
     fc8:	b8 08 00 00 00       	mov    $0x8,%eax
     fcd:	cd 40                	int    $0x40
     fcf:	c3                   	ret    

00000fd0 <link>:
SYSCALL(link)
     fd0:	b8 13 00 00 00       	mov    $0x13,%eax
     fd5:	cd 40                	int    $0x40
     fd7:	c3                   	ret    

00000fd8 <mkdir>:
SYSCALL(mkdir)
     fd8:	b8 14 00 00 00       	mov    $0x14,%eax
     fdd:	cd 40                	int    $0x40
     fdf:	c3                   	ret    

00000fe0 <chdir>:
SYSCALL(chdir)
     fe0:	b8 09 00 00 00       	mov    $0x9,%eax
     fe5:	cd 40                	int    $0x40
     fe7:	c3                   	ret    

00000fe8 <dup>:
SYSCALL(dup)
     fe8:	b8 0a 00 00 00       	mov    $0xa,%eax
     fed:	cd 40                	int    $0x40
     fef:	c3                   	ret    

00000ff0 <getpid>:
SYSCALL(getpid)
     ff0:	b8 0b 00 00 00       	mov    $0xb,%eax
     ff5:	cd 40                	int    $0x40
     ff7:	c3                   	ret    

00000ff8 <sbrk>:
SYSCALL(sbrk)
     ff8:	b8 0c 00 00 00       	mov    $0xc,%eax
     ffd:	cd 40                	int    $0x40
     fff:	c3                   	ret    

00001000 <sleep>:
SYSCALL(sleep)
    1000:	b8 0d 00 00 00       	mov    $0xd,%eax
    1005:	cd 40                	int    $0x40
    1007:	c3                   	ret    

00001008 <uptime>:
SYSCALL(uptime)
    1008:	b8 0e 00 00 00       	mov    $0xe,%eax
    100d:	cd 40                	int    $0x40
    100f:	c3                   	ret    

00001010 <hello>:
SYSCALL(hello)
    1010:	b8 16 00 00 00       	mov    $0x16,%eax
    1015:	cd 40                	int    $0x40
    1017:	c3                   	ret    

00001018 <cps>:
SYSCALL(cps)
    1018:	b8 17 00 00 00       	mov    $0x17,%eax
    101d:	cd 40                	int    $0x40
    101f:	c3                   	ret    

00001020 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1020:	55                   	push   %ebp
    1021:	89 e5                	mov    %esp,%ebp
    1023:	83 ec 18             	sub    $0x18,%esp
    1026:	8b 45 0c             	mov    0xc(%ebp),%eax
    1029:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    102c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1033:	00 
    1034:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1037:	89 44 24 04          	mov    %eax,0x4(%esp)
    103b:	8b 45 08             	mov    0x8(%ebp),%eax
    103e:	89 04 24             	mov    %eax,(%esp)
    1041:	e8 4a ff ff ff       	call   f90 <write>
}
    1046:	c9                   	leave  
    1047:	c3                   	ret    

00001048 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1048:	55                   	push   %ebp
    1049:	89 e5                	mov    %esp,%ebp
    104b:	56                   	push   %esi
    104c:	53                   	push   %ebx
    104d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1050:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1057:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    105b:	74 17                	je     1074 <printint+0x2c>
    105d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1061:	79 11                	jns    1074 <printint+0x2c>
    neg = 1;
    1063:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    106a:	8b 45 0c             	mov    0xc(%ebp),%eax
    106d:	f7 d8                	neg    %eax
    106f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1072:	eb 06                	jmp    107a <printint+0x32>
  } else {
    x = xx;
    1074:	8b 45 0c             	mov    0xc(%ebp),%eax
    1077:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    107a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1081:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1084:	8d 41 01             	lea    0x1(%ecx),%eax
    1087:	89 45 f4             	mov    %eax,-0xc(%ebp)
    108a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    108d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1090:	ba 00 00 00 00       	mov    $0x0,%edx
    1095:	f7 f3                	div    %ebx
    1097:	89 d0                	mov    %edx,%eax
    1099:	0f b6 80 52 1a 00 00 	movzbl 0x1a52(%eax),%eax
    10a0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    10a4:	8b 75 10             	mov    0x10(%ebp),%esi
    10a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10aa:	ba 00 00 00 00       	mov    $0x0,%edx
    10af:	f7 f6                	div    %esi
    10b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    10b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    10b8:	75 c7                	jne    1081 <printint+0x39>
  if(neg)
    10ba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10be:	74 10                	je     10d0 <printint+0x88>
    buf[i++] = '-';
    10c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c3:	8d 50 01             	lea    0x1(%eax),%edx
    10c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    10c9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    10ce:	eb 1f                	jmp    10ef <printint+0xa7>
    10d0:	eb 1d                	jmp    10ef <printint+0xa7>
    putc(fd, buf[i]);
    10d2:	8d 55 dc             	lea    -0x24(%ebp),%edx
    10d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d8:	01 d0                	add    %edx,%eax
    10da:	0f b6 00             	movzbl (%eax),%eax
    10dd:	0f be c0             	movsbl %al,%eax
    10e0:	89 44 24 04          	mov    %eax,0x4(%esp)
    10e4:	8b 45 08             	mov    0x8(%ebp),%eax
    10e7:	89 04 24             	mov    %eax,(%esp)
    10ea:	e8 31 ff ff ff       	call   1020 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    10ef:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    10f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    10f7:	79 d9                	jns    10d2 <printint+0x8a>
    putc(fd, buf[i]);
}
    10f9:	83 c4 30             	add    $0x30,%esp
    10fc:	5b                   	pop    %ebx
    10fd:	5e                   	pop    %esi
    10fe:	5d                   	pop    %ebp
    10ff:	c3                   	ret    

00001100 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1106:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    110d:	8d 45 0c             	lea    0xc(%ebp),%eax
    1110:	83 c0 04             	add    $0x4,%eax
    1113:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1116:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    111d:	e9 7c 01 00 00       	jmp    129e <printf+0x19e>
    c = fmt[i] & 0xff;
    1122:	8b 55 0c             	mov    0xc(%ebp),%edx
    1125:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1128:	01 d0                	add    %edx,%eax
    112a:	0f b6 00             	movzbl (%eax),%eax
    112d:	0f be c0             	movsbl %al,%eax
    1130:	25 ff 00 00 00       	and    $0xff,%eax
    1135:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1138:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    113c:	75 2c                	jne    116a <printf+0x6a>
      if(c == '%'){
    113e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    1142:	75 0c                	jne    1150 <printf+0x50>
        state = '%';
    1144:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    114b:	e9 4a 01 00 00       	jmp    129a <printf+0x19a>
      } else {
        putc(fd, c);
    1150:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1153:	0f be c0             	movsbl %al,%eax
    1156:	89 44 24 04          	mov    %eax,0x4(%esp)
    115a:	8b 45 08             	mov    0x8(%ebp),%eax
    115d:	89 04 24             	mov    %eax,(%esp)
    1160:	e8 bb fe ff ff       	call   1020 <putc>
    1165:	e9 30 01 00 00       	jmp    129a <printf+0x19a>
      }
    } else if(state == '%'){
    116a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    116e:	0f 85 26 01 00 00    	jne    129a <printf+0x19a>
      if(c == 'd'){
    1174:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1178:	75 2d                	jne    11a7 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    117a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    117d:	8b 00                	mov    (%eax),%eax
    117f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1186:	00 
    1187:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    118e:	00 
    118f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1193:	8b 45 08             	mov    0x8(%ebp),%eax
    1196:	89 04 24             	mov    %eax,(%esp)
    1199:	e8 aa fe ff ff       	call   1048 <printint>
        ap++;
    119e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    11a2:	e9 ec 00 00 00       	jmp    1293 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    11a7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    11ab:	74 06                	je     11b3 <printf+0xb3>
    11ad:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    11b1:	75 2d                	jne    11e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    11b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11b6:	8b 00                	mov    (%eax),%eax
    11b8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    11bf:	00 
    11c0:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    11c7:	00 
    11c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    11cc:	8b 45 08             	mov    0x8(%ebp),%eax
    11cf:	89 04 24             	mov    %eax,(%esp)
    11d2:	e8 71 fe ff ff       	call   1048 <printint>
        ap++;
    11d7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    11db:	e9 b3 00 00 00       	jmp    1293 <printf+0x193>
      } else if(c == 's'){
    11e0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    11e4:	75 45                	jne    122b <printf+0x12b>
        s = (char*)*ap;
    11e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11e9:	8b 00                	mov    (%eax),%eax
    11eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    11ee:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    11f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11f6:	75 09                	jne    1201 <printf+0x101>
          s = "(null)";
    11f8:	c7 45 f4 bc 15 00 00 	movl   $0x15bc,-0xc(%ebp)
        while(*s != 0){
    11ff:	eb 1e                	jmp    121f <printf+0x11f>
    1201:	eb 1c                	jmp    121f <printf+0x11f>
          putc(fd, *s);
    1203:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1206:	0f b6 00             	movzbl (%eax),%eax
    1209:	0f be c0             	movsbl %al,%eax
    120c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1210:	8b 45 08             	mov    0x8(%ebp),%eax
    1213:	89 04 24             	mov    %eax,(%esp)
    1216:	e8 05 fe ff ff       	call   1020 <putc>
          s++;
    121b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    121f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1222:	0f b6 00             	movzbl (%eax),%eax
    1225:	84 c0                	test   %al,%al
    1227:	75 da                	jne    1203 <printf+0x103>
    1229:	eb 68                	jmp    1293 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    122b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    122f:	75 1d                	jne    124e <printf+0x14e>
        putc(fd, *ap);
    1231:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1234:	8b 00                	mov    (%eax),%eax
    1236:	0f be c0             	movsbl %al,%eax
    1239:	89 44 24 04          	mov    %eax,0x4(%esp)
    123d:	8b 45 08             	mov    0x8(%ebp),%eax
    1240:	89 04 24             	mov    %eax,(%esp)
    1243:	e8 d8 fd ff ff       	call   1020 <putc>
        ap++;
    1248:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    124c:	eb 45                	jmp    1293 <printf+0x193>
      } else if(c == '%'){
    124e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    1252:	75 17                	jne    126b <printf+0x16b>
        putc(fd, c);
    1254:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1257:	0f be c0             	movsbl %al,%eax
    125a:	89 44 24 04          	mov    %eax,0x4(%esp)
    125e:	8b 45 08             	mov    0x8(%ebp),%eax
    1261:	89 04 24             	mov    %eax,(%esp)
    1264:	e8 b7 fd ff ff       	call   1020 <putc>
    1269:	eb 28                	jmp    1293 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    126b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1272:	00 
    1273:	8b 45 08             	mov    0x8(%ebp),%eax
    1276:	89 04 24             	mov    %eax,(%esp)
    1279:	e8 a2 fd ff ff       	call   1020 <putc>
        putc(fd, c);
    127e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1281:	0f be c0             	movsbl %al,%eax
    1284:	89 44 24 04          	mov    %eax,0x4(%esp)
    1288:	8b 45 08             	mov    0x8(%ebp),%eax
    128b:	89 04 24             	mov    %eax,(%esp)
    128e:	e8 8d fd ff ff       	call   1020 <putc>
      }
      state = 0;
    1293:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    129a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    129e:	8b 55 0c             	mov    0xc(%ebp),%edx
    12a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12a4:	01 d0                	add    %edx,%eax
    12a6:	0f b6 00             	movzbl (%eax),%eax
    12a9:	84 c0                	test   %al,%al
    12ab:	0f 85 71 fe ff ff    	jne    1122 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    12b1:	c9                   	leave  
    12b2:	c3                   	ret    

000012b3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12b3:	55                   	push   %ebp
    12b4:	89 e5                	mov    %esp,%ebp
    12b6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    12b9:	8b 45 08             	mov    0x8(%ebp),%eax
    12bc:	83 e8 08             	sub    $0x8,%eax
    12bf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12c2:	a1 ec 1a 00 00       	mov    0x1aec,%eax
    12c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12ca:	eb 24                	jmp    12f0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12cf:	8b 00                	mov    (%eax),%eax
    12d1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12d4:	77 12                	ja     12e8 <free+0x35>
    12d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12d9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12dc:	77 24                	ja     1302 <free+0x4f>
    12de:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12e1:	8b 00                	mov    (%eax),%eax
    12e3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    12e6:	77 1a                	ja     1302 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12eb:	8b 00                	mov    (%eax),%eax
    12ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12f6:	76 d4                	jbe    12cc <free+0x19>
    12f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12fb:	8b 00                	mov    (%eax),%eax
    12fd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1300:	76 ca                	jbe    12cc <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1302:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1305:	8b 40 04             	mov    0x4(%eax),%eax
    1308:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    130f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1312:	01 c2                	add    %eax,%edx
    1314:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1317:	8b 00                	mov    (%eax),%eax
    1319:	39 c2                	cmp    %eax,%edx
    131b:	75 24                	jne    1341 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    131d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1320:	8b 50 04             	mov    0x4(%eax),%edx
    1323:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1326:	8b 00                	mov    (%eax),%eax
    1328:	8b 40 04             	mov    0x4(%eax),%eax
    132b:	01 c2                	add    %eax,%edx
    132d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1330:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1333:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1336:	8b 00                	mov    (%eax),%eax
    1338:	8b 10                	mov    (%eax),%edx
    133a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    133d:	89 10                	mov    %edx,(%eax)
    133f:	eb 0a                	jmp    134b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1341:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1344:	8b 10                	mov    (%eax),%edx
    1346:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1349:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    134b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    134e:	8b 40 04             	mov    0x4(%eax),%eax
    1351:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1358:	8b 45 fc             	mov    -0x4(%ebp),%eax
    135b:	01 d0                	add    %edx,%eax
    135d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1360:	75 20                	jne    1382 <free+0xcf>
    p->s.size += bp->s.size;
    1362:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1365:	8b 50 04             	mov    0x4(%eax),%edx
    1368:	8b 45 f8             	mov    -0x8(%ebp),%eax
    136b:	8b 40 04             	mov    0x4(%eax),%eax
    136e:	01 c2                	add    %eax,%edx
    1370:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1373:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1376:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1379:	8b 10                	mov    (%eax),%edx
    137b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    137e:	89 10                	mov    %edx,(%eax)
    1380:	eb 08                	jmp    138a <free+0xd7>
  } else
    p->s.ptr = bp;
    1382:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1385:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1388:	89 10                	mov    %edx,(%eax)
  freep = p;
    138a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    138d:	a3 ec 1a 00 00       	mov    %eax,0x1aec
}
    1392:	c9                   	leave  
    1393:	c3                   	ret    

00001394 <morecore>:

static Header*
morecore(uint nu)
{
    1394:	55                   	push   %ebp
    1395:	89 e5                	mov    %esp,%ebp
    1397:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    139a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    13a1:	77 07                	ja     13aa <morecore+0x16>
    nu = 4096;
    13a3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    13aa:	8b 45 08             	mov    0x8(%ebp),%eax
    13ad:	c1 e0 03             	shl    $0x3,%eax
    13b0:	89 04 24             	mov    %eax,(%esp)
    13b3:	e8 40 fc ff ff       	call   ff8 <sbrk>
    13b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    13bb:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    13bf:	75 07                	jne    13c8 <morecore+0x34>
    return 0;
    13c1:	b8 00 00 00 00       	mov    $0x0,%eax
    13c6:	eb 22                	jmp    13ea <morecore+0x56>
  hp = (Header*)p;
    13c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    13ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13d1:	8b 55 08             	mov    0x8(%ebp),%edx
    13d4:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    13d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13da:	83 c0 08             	add    $0x8,%eax
    13dd:	89 04 24             	mov    %eax,(%esp)
    13e0:	e8 ce fe ff ff       	call   12b3 <free>
  return freep;
    13e5:	a1 ec 1a 00 00       	mov    0x1aec,%eax
}
    13ea:	c9                   	leave  
    13eb:	c3                   	ret    

000013ec <malloc>:

void*
malloc(uint nbytes)
{
    13ec:	55                   	push   %ebp
    13ed:	89 e5                	mov    %esp,%ebp
    13ef:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13f2:	8b 45 08             	mov    0x8(%ebp),%eax
    13f5:	83 c0 07             	add    $0x7,%eax
    13f8:	c1 e8 03             	shr    $0x3,%eax
    13fb:	83 c0 01             	add    $0x1,%eax
    13fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1401:	a1 ec 1a 00 00       	mov    0x1aec,%eax
    1406:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1409:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    140d:	75 23                	jne    1432 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    140f:	c7 45 f0 e4 1a 00 00 	movl   $0x1ae4,-0x10(%ebp)
    1416:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1419:	a3 ec 1a 00 00       	mov    %eax,0x1aec
    141e:	a1 ec 1a 00 00       	mov    0x1aec,%eax
    1423:	a3 e4 1a 00 00       	mov    %eax,0x1ae4
    base.s.size = 0;
    1428:	c7 05 e8 1a 00 00 00 	movl   $0x0,0x1ae8
    142f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1432:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1435:	8b 00                	mov    (%eax),%eax
    1437:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    143a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    143d:	8b 40 04             	mov    0x4(%eax),%eax
    1440:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1443:	72 4d                	jb     1492 <malloc+0xa6>
      if(p->s.size == nunits)
    1445:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1448:	8b 40 04             	mov    0x4(%eax),%eax
    144b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    144e:	75 0c                	jne    145c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1450:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1453:	8b 10                	mov    (%eax),%edx
    1455:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1458:	89 10                	mov    %edx,(%eax)
    145a:	eb 26                	jmp    1482 <malloc+0x96>
      else {
        p->s.size -= nunits;
    145c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    145f:	8b 40 04             	mov    0x4(%eax),%eax
    1462:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1465:	89 c2                	mov    %eax,%edx
    1467:	8b 45 f4             	mov    -0xc(%ebp),%eax
    146a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    146d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1470:	8b 40 04             	mov    0x4(%eax),%eax
    1473:	c1 e0 03             	shl    $0x3,%eax
    1476:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1479:	8b 45 f4             	mov    -0xc(%ebp),%eax
    147c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    147f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1482:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1485:	a3 ec 1a 00 00       	mov    %eax,0x1aec
      return (void*)(p + 1);
    148a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    148d:	83 c0 08             	add    $0x8,%eax
    1490:	eb 38                	jmp    14ca <malloc+0xde>
    }
    if(p == freep)
    1492:	a1 ec 1a 00 00       	mov    0x1aec,%eax
    1497:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    149a:	75 1b                	jne    14b7 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    149c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    149f:	89 04 24             	mov    %eax,(%esp)
    14a2:	e8 ed fe ff ff       	call   1394 <morecore>
    14a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    14aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14ae:	75 07                	jne    14b7 <malloc+0xcb>
        return 0;
    14b0:	b8 00 00 00 00       	mov    $0x0,%eax
    14b5:	eb 13                	jmp    14ca <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    14b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
    14bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14c0:	8b 00                	mov    (%eax),%eax
    14c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    14c5:	e9 70 ff ff ff       	jmp    143a <malloc+0x4e>
}
    14ca:	c9                   	leave  
    14cb:	c3                   	ret    
