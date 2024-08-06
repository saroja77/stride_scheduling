
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "iput test\n");
       6:	a1 04 64 00 00       	mov    0x6404,%eax
       b:	c7 44 24 04 5a 45 00 	movl   $0x455a,0x4(%esp)
      12:	00 
      13:	89 04 24             	mov    %eax,(%esp)
      16:	e8 5c 41 00 00       	call   4177 <printf>

  if(mkdir("iputdir") < 0){
      1b:	c7 04 24 65 45 00 00 	movl   $0x4565,(%esp)
      22:	e8 28 40 00 00       	call   404f <mkdir>
      27:	85 c0                	test   %eax,%eax
      29:	79 1a                	jns    45 <iputtest+0x45>
    printf(stdout, "mkdir failed\n");
      2b:	a1 04 64 00 00       	mov    0x6404,%eax
      30:	c7 44 24 04 6d 45 00 	movl   $0x456d,0x4(%esp)
      37:	00 
      38:	89 04 24             	mov    %eax,(%esp)
      3b:	e8 37 41 00 00       	call   4177 <printf>
    exit();
      40:	e8 a2 3f 00 00       	call   3fe7 <exit>
  }
  if(chdir("iputdir") < 0){
      45:	c7 04 24 65 45 00 00 	movl   $0x4565,(%esp)
      4c:	e8 06 40 00 00       	call   4057 <chdir>
      51:	85 c0                	test   %eax,%eax
      53:	79 1a                	jns    6f <iputtest+0x6f>
    printf(stdout, "chdir iputdir failed\n");
      55:	a1 04 64 00 00       	mov    0x6404,%eax
      5a:	c7 44 24 04 7b 45 00 	movl   $0x457b,0x4(%esp)
      61:	00 
      62:	89 04 24             	mov    %eax,(%esp)
      65:	e8 0d 41 00 00       	call   4177 <printf>
    exit();
      6a:	e8 78 3f 00 00       	call   3fe7 <exit>
  }
  if(unlink("../iputdir") < 0){
      6f:	c7 04 24 91 45 00 00 	movl   $0x4591,(%esp)
      76:	e8 bc 3f 00 00       	call   4037 <unlink>
      7b:	85 c0                	test   %eax,%eax
      7d:	79 1a                	jns    99 <iputtest+0x99>
    printf(stdout, "unlink ../iputdir failed\n");
      7f:	a1 04 64 00 00       	mov    0x6404,%eax
      84:	c7 44 24 04 9c 45 00 	movl   $0x459c,0x4(%esp)
      8b:	00 
      8c:	89 04 24             	mov    %eax,(%esp)
      8f:	e8 e3 40 00 00       	call   4177 <printf>
    exit();
      94:	e8 4e 3f 00 00       	call   3fe7 <exit>
  }
  if(chdir("/") < 0){
      99:	c7 04 24 b6 45 00 00 	movl   $0x45b6,(%esp)
      a0:	e8 b2 3f 00 00       	call   4057 <chdir>
      a5:	85 c0                	test   %eax,%eax
      a7:	79 1a                	jns    c3 <iputtest+0xc3>
    printf(stdout, "chdir / failed\n");
      a9:	a1 04 64 00 00       	mov    0x6404,%eax
      ae:	c7 44 24 04 b8 45 00 	movl   $0x45b8,0x4(%esp)
      b5:	00 
      b6:	89 04 24             	mov    %eax,(%esp)
      b9:	e8 b9 40 00 00       	call   4177 <printf>
    exit();
      be:	e8 24 3f 00 00       	call   3fe7 <exit>
  }
  printf(stdout, "iput test ok\n");
      c3:	a1 04 64 00 00       	mov    0x6404,%eax
      c8:	c7 44 24 04 c8 45 00 	movl   $0x45c8,0x4(%esp)
      cf:	00 
      d0:	89 04 24             	mov    %eax,(%esp)
      d3:	e8 9f 40 00 00       	call   4177 <printf>
}
      d8:	c9                   	leave  
      d9:	c3                   	ret    

000000da <exitiputtest>:

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
      da:	55                   	push   %ebp
      db:	89 e5                	mov    %esp,%ebp
      dd:	83 ec 28             	sub    $0x28,%esp
  int pid;

  printf(stdout, "exitiput test\n");
      e0:	a1 04 64 00 00       	mov    0x6404,%eax
      e5:	c7 44 24 04 d6 45 00 	movl   $0x45d6,0x4(%esp)
      ec:	00 
      ed:	89 04 24             	mov    %eax,(%esp)
      f0:	e8 82 40 00 00       	call   4177 <printf>

  pid = fork(0,0);
      f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      fc:	00 
      fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     104:	e8 d6 3e 00 00       	call   3fdf <fork>
     109:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid < 0){
     10c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     110:	79 1a                	jns    12c <exitiputtest+0x52>
    printf(stdout, "fork failed\n");
     112:	a1 04 64 00 00       	mov    0x6404,%eax
     117:	c7 44 24 04 e5 45 00 	movl   $0x45e5,0x4(%esp)
     11e:	00 
     11f:	89 04 24             	mov    %eax,(%esp)
     122:	e8 50 40 00 00       	call   4177 <printf>
    exit();
     127:	e8 bb 3e 00 00       	call   3fe7 <exit>
  }
  if(pid == 0){
     12c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     130:	0f 85 83 00 00 00    	jne    1b9 <exitiputtest+0xdf>
    if(mkdir("iputdir") < 0){
     136:	c7 04 24 65 45 00 00 	movl   $0x4565,(%esp)
     13d:	e8 0d 3f 00 00       	call   404f <mkdir>
     142:	85 c0                	test   %eax,%eax
     144:	79 1a                	jns    160 <exitiputtest+0x86>
      printf(stdout, "mkdir failed\n");
     146:	a1 04 64 00 00       	mov    0x6404,%eax
     14b:	c7 44 24 04 6d 45 00 	movl   $0x456d,0x4(%esp)
     152:	00 
     153:	89 04 24             	mov    %eax,(%esp)
     156:	e8 1c 40 00 00       	call   4177 <printf>
      exit();
     15b:	e8 87 3e 00 00       	call   3fe7 <exit>
    }
    if(chdir("iputdir") < 0){
     160:	c7 04 24 65 45 00 00 	movl   $0x4565,(%esp)
     167:	e8 eb 3e 00 00       	call   4057 <chdir>
     16c:	85 c0                	test   %eax,%eax
     16e:	79 1a                	jns    18a <exitiputtest+0xb0>
      printf(stdout, "child chdir failed\n");
     170:	a1 04 64 00 00       	mov    0x6404,%eax
     175:	c7 44 24 04 f2 45 00 	movl   $0x45f2,0x4(%esp)
     17c:	00 
     17d:	89 04 24             	mov    %eax,(%esp)
     180:	e8 f2 3f 00 00       	call   4177 <printf>
      exit();
     185:	e8 5d 3e 00 00       	call   3fe7 <exit>
    }
    if(unlink("../iputdir") < 0){
     18a:	c7 04 24 91 45 00 00 	movl   $0x4591,(%esp)
     191:	e8 a1 3e 00 00       	call   4037 <unlink>
     196:	85 c0                	test   %eax,%eax
     198:	79 1a                	jns    1b4 <exitiputtest+0xda>
      printf(stdout, "unlink ../iputdir failed\n");
     19a:	a1 04 64 00 00       	mov    0x6404,%eax
     19f:	c7 44 24 04 9c 45 00 	movl   $0x459c,0x4(%esp)
     1a6:	00 
     1a7:	89 04 24             	mov    %eax,(%esp)
     1aa:	e8 c8 3f 00 00       	call   4177 <printf>
      exit();
     1af:	e8 33 3e 00 00       	call   3fe7 <exit>
    }
    exit();
     1b4:	e8 2e 3e 00 00       	call   3fe7 <exit>
  }
  wait();
     1b9:	e8 31 3e 00 00       	call   3fef <wait>
  printf(stdout, "exitiput test ok\n");
     1be:	a1 04 64 00 00       	mov    0x6404,%eax
     1c3:	c7 44 24 04 06 46 00 	movl   $0x4606,0x4(%esp)
     1ca:	00 
     1cb:	89 04 24             	mov    %eax,(%esp)
     1ce:	e8 a4 3f 00 00       	call   4177 <printf>
}
     1d3:	c9                   	leave  
     1d4:	c3                   	ret    

000001d5 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     1d5:	55                   	push   %ebp
     1d6:	89 e5                	mov    %esp,%ebp
     1d8:	83 ec 28             	sub    $0x28,%esp
  int pid;

  printf(stdout, "openiput test\n");
     1db:	a1 04 64 00 00       	mov    0x6404,%eax
     1e0:	c7 44 24 04 18 46 00 	movl   $0x4618,0x4(%esp)
     1e7:	00 
     1e8:	89 04 24             	mov    %eax,(%esp)
     1eb:	e8 87 3f 00 00       	call   4177 <printf>
  if(mkdir("oidir") < 0){
     1f0:	c7 04 24 27 46 00 00 	movl   $0x4627,(%esp)
     1f7:	e8 53 3e 00 00       	call   404f <mkdir>
     1fc:	85 c0                	test   %eax,%eax
     1fe:	79 1a                	jns    21a <openiputtest+0x45>
    printf(stdout, "mkdir oidir failed\n");
     200:	a1 04 64 00 00       	mov    0x6404,%eax
     205:	c7 44 24 04 2d 46 00 	movl   $0x462d,0x4(%esp)
     20c:	00 
     20d:	89 04 24             	mov    %eax,(%esp)
     210:	e8 62 3f 00 00       	call   4177 <printf>
    exit();
     215:	e8 cd 3d 00 00       	call   3fe7 <exit>
  }
  pid = fork(0,0);
     21a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     221:	00 
     222:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     229:	e8 b1 3d 00 00       	call   3fdf <fork>
     22e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid < 0){
     231:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     235:	79 1a                	jns    251 <openiputtest+0x7c>
    printf(stdout, "fork failed\n");
     237:	a1 04 64 00 00       	mov    0x6404,%eax
     23c:	c7 44 24 04 e5 45 00 	movl   $0x45e5,0x4(%esp)
     243:	00 
     244:	89 04 24             	mov    %eax,(%esp)
     247:	e8 2b 3f 00 00       	call   4177 <printf>
    exit();
     24c:	e8 96 3d 00 00       	call   3fe7 <exit>
  }
  if(pid == 0){
     251:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     255:	75 3c                	jne    293 <openiputtest+0xbe>
    int fd = open("oidir", O_RDWR);
     257:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     25e:	00 
     25f:	c7 04 24 27 46 00 00 	movl   $0x4627,(%esp)
     266:	e8 bc 3d 00 00       	call   4027 <open>
     26b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0){
     26e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     272:	78 1a                	js     28e <openiputtest+0xb9>
      printf(stdout, "open directory for write succeeded\n");
     274:	a1 04 64 00 00       	mov    0x6404,%eax
     279:	c7 44 24 04 44 46 00 	movl   $0x4644,0x4(%esp)
     280:	00 
     281:	89 04 24             	mov    %eax,(%esp)
     284:	e8 ee 3e 00 00       	call   4177 <printf>
      exit();
     289:	e8 59 3d 00 00       	call   3fe7 <exit>
    }
    exit();
     28e:	e8 54 3d 00 00       	call   3fe7 <exit>
  }
  sleep(1);
     293:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     29a:	e8 d8 3d 00 00       	call   4077 <sleep>
  if(unlink("oidir") != 0){
     29f:	c7 04 24 27 46 00 00 	movl   $0x4627,(%esp)
     2a6:	e8 8c 3d 00 00       	call   4037 <unlink>
     2ab:	85 c0                	test   %eax,%eax
     2ad:	74 1a                	je     2c9 <openiputtest+0xf4>
    printf(stdout, "unlink failed\n");
     2af:	a1 04 64 00 00       	mov    0x6404,%eax
     2b4:	c7 44 24 04 68 46 00 	movl   $0x4668,0x4(%esp)
     2bb:	00 
     2bc:	89 04 24             	mov    %eax,(%esp)
     2bf:	e8 b3 3e 00 00       	call   4177 <printf>
    exit();
     2c4:	e8 1e 3d 00 00       	call   3fe7 <exit>
  }
  wait();
     2c9:	e8 21 3d 00 00       	call   3fef <wait>
  printf(stdout, "openiput test ok\n");
     2ce:	a1 04 64 00 00       	mov    0x6404,%eax
     2d3:	c7 44 24 04 77 46 00 	movl   $0x4677,0x4(%esp)
     2da:	00 
     2db:	89 04 24             	mov    %eax,(%esp)
     2de:	e8 94 3e 00 00       	call   4177 <printf>
}
     2e3:	c9                   	leave  
     2e4:	c3                   	ret    

000002e5 <opentest>:

// simple file system tests

void
opentest(void)
{
     2e5:	55                   	push   %ebp
     2e6:	89 e5                	mov    %esp,%ebp
     2e8:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(stdout, "open test\n");
     2eb:	a1 04 64 00 00       	mov    0x6404,%eax
     2f0:	c7 44 24 04 89 46 00 	movl   $0x4689,0x4(%esp)
     2f7:	00 
     2f8:	89 04 24             	mov    %eax,(%esp)
     2fb:	e8 77 3e 00 00       	call   4177 <printf>
  fd = open("echo", 0);
     300:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     307:	00 
     308:	c7 04 24 44 45 00 00 	movl   $0x4544,(%esp)
     30f:	e8 13 3d 00 00       	call   4027 <open>
     314:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
     317:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     31b:	79 1a                	jns    337 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
     31d:	a1 04 64 00 00       	mov    0x6404,%eax
     322:	c7 44 24 04 94 46 00 	movl   $0x4694,0x4(%esp)
     329:	00 
     32a:	89 04 24             	mov    %eax,(%esp)
     32d:	e8 45 3e 00 00       	call   4177 <printf>
    exit();
     332:	e8 b0 3c 00 00       	call   3fe7 <exit>
  }
  close(fd);
     337:	8b 45 f4             	mov    -0xc(%ebp),%eax
     33a:	89 04 24             	mov    %eax,(%esp)
     33d:	e8 cd 3c 00 00       	call   400f <close>
  fd = open("doesnotexist", 0);
     342:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     349:	00 
     34a:	c7 04 24 a7 46 00 00 	movl   $0x46a7,(%esp)
     351:	e8 d1 3c 00 00       	call   4027 <open>
     356:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
     359:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     35d:	78 1a                	js     379 <opentest+0x94>
    printf(stdout, "open doesnotexist succeeded!\n");
     35f:	a1 04 64 00 00       	mov    0x6404,%eax
     364:	c7 44 24 04 b4 46 00 	movl   $0x46b4,0x4(%esp)
     36b:	00 
     36c:	89 04 24             	mov    %eax,(%esp)
     36f:	e8 03 3e 00 00       	call   4177 <printf>
    exit();
     374:	e8 6e 3c 00 00       	call   3fe7 <exit>
  }
  printf(stdout, "open test ok\n");
     379:	a1 04 64 00 00       	mov    0x6404,%eax
     37e:	c7 44 24 04 d2 46 00 	movl   $0x46d2,0x4(%esp)
     385:	00 
     386:	89 04 24             	mov    %eax,(%esp)
     389:	e8 e9 3d 00 00       	call   4177 <printf>
}
     38e:	c9                   	leave  
     38f:	c3                   	ret    

00000390 <writetest>:

void
writetest(void)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
     396:	a1 04 64 00 00       	mov    0x6404,%eax
     39b:	c7 44 24 04 e0 46 00 	movl   $0x46e0,0x4(%esp)
     3a2:	00 
     3a3:	89 04 24             	mov    %eax,(%esp)
     3a6:	e8 cc 3d 00 00       	call   4177 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     3ab:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     3b2:	00 
     3b3:	c7 04 24 f1 46 00 00 	movl   $0x46f1,(%esp)
     3ba:	e8 68 3c 00 00       	call   4027 <open>
     3bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     3c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3c6:	78 21                	js     3e9 <writetest+0x59>
    printf(stdout, "creat small succeeded; ok\n");
     3c8:	a1 04 64 00 00       	mov    0x6404,%eax
     3cd:	c7 44 24 04 f7 46 00 	movl   $0x46f7,0x4(%esp)
     3d4:	00 
     3d5:	89 04 24             	mov    %eax,(%esp)
     3d8:	e8 9a 3d 00 00       	call   4177 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     3dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     3e4:	e9 a0 00 00 00       	jmp    489 <writetest+0xf9>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     3e9:	a1 04 64 00 00       	mov    0x6404,%eax
     3ee:	c7 44 24 04 12 47 00 	movl   $0x4712,0x4(%esp)
     3f5:	00 
     3f6:	89 04 24             	mov    %eax,(%esp)
     3f9:	e8 79 3d 00 00       	call   4177 <printf>
    exit();
     3fe:	e8 e4 3b 00 00       	call   3fe7 <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     403:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     40a:	00 
     40b:	c7 44 24 04 2e 47 00 	movl   $0x472e,0x4(%esp)
     412:	00 
     413:	8b 45 f0             	mov    -0x10(%ebp),%eax
     416:	89 04 24             	mov    %eax,(%esp)
     419:	e8 e9 3b 00 00       	call   4007 <write>
     41e:	83 f8 0a             	cmp    $0xa,%eax
     421:	74 21                	je     444 <writetest+0xb4>
      printf(stdout, "error: write aa %d new file failed\n", i);
     423:	a1 04 64 00 00       	mov    0x6404,%eax
     428:	8b 55 f4             	mov    -0xc(%ebp),%edx
     42b:	89 54 24 08          	mov    %edx,0x8(%esp)
     42f:	c7 44 24 04 3c 47 00 	movl   $0x473c,0x4(%esp)
     436:	00 
     437:	89 04 24             	mov    %eax,(%esp)
     43a:	e8 38 3d 00 00       	call   4177 <printf>
      exit();
     43f:	e8 a3 3b 00 00       	call   3fe7 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     444:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     44b:	00 
     44c:	c7 44 24 04 60 47 00 	movl   $0x4760,0x4(%esp)
     453:	00 
     454:	8b 45 f0             	mov    -0x10(%ebp),%eax
     457:	89 04 24             	mov    %eax,(%esp)
     45a:	e8 a8 3b 00 00       	call   4007 <write>
     45f:	83 f8 0a             	cmp    $0xa,%eax
     462:	74 21                	je     485 <writetest+0xf5>
      printf(stdout, "error: write bb %d new file failed\n", i);
     464:	a1 04 64 00 00       	mov    0x6404,%eax
     469:	8b 55 f4             	mov    -0xc(%ebp),%edx
     46c:	89 54 24 08          	mov    %edx,0x8(%esp)
     470:	c7 44 24 04 6c 47 00 	movl   $0x476c,0x4(%esp)
     477:	00 
     478:	89 04 24             	mov    %eax,(%esp)
     47b:	e8 f7 3c 00 00       	call   4177 <printf>
      exit();
     480:	e8 62 3b 00 00       	call   3fe7 <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     485:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     489:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     48d:	0f 8e 70 ff ff ff    	jle    403 <writetest+0x73>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     493:	a1 04 64 00 00       	mov    0x6404,%eax
     498:	c7 44 24 04 90 47 00 	movl   $0x4790,0x4(%esp)
     49f:	00 
     4a0:	89 04 24             	mov    %eax,(%esp)
     4a3:	e8 cf 3c 00 00       	call   4177 <printf>
  close(fd);
     4a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4ab:	89 04 24             	mov    %eax,(%esp)
     4ae:	e8 5c 3b 00 00       	call   400f <close>
  fd = open("small", O_RDONLY);
     4b3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4ba:	00 
     4bb:	c7 04 24 f1 46 00 00 	movl   $0x46f1,(%esp)
     4c2:	e8 60 3b 00 00       	call   4027 <open>
     4c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     4ca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4ce:	78 3e                	js     50e <writetest+0x17e>
    printf(stdout, "open small succeeded ok\n");
     4d0:	a1 04 64 00 00       	mov    0x6404,%eax
     4d5:	c7 44 24 04 9b 47 00 	movl   $0x479b,0x4(%esp)
     4dc:	00 
     4dd:	89 04 24             	mov    %eax,(%esp)
     4e0:	e8 92 3c 00 00       	call   4177 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     4e5:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
     4ec:	00 
     4ed:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     4f4:	00 
     4f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4f8:	89 04 24             	mov    %eax,(%esp)
     4fb:	e8 ff 3a 00 00       	call   3fff <read>
     500:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     503:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     50a:	75 4e                	jne    55a <writetest+0x1ca>
     50c:	eb 1a                	jmp    528 <writetest+0x198>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     50e:	a1 04 64 00 00       	mov    0x6404,%eax
     513:	c7 44 24 04 b4 47 00 	movl   $0x47b4,0x4(%esp)
     51a:	00 
     51b:	89 04 24             	mov    %eax,(%esp)
     51e:	e8 54 3c 00 00       	call   4177 <printf>
    exit();
     523:	e8 bf 3a 00 00       	call   3fe7 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     528:	a1 04 64 00 00       	mov    0x6404,%eax
     52d:	c7 44 24 04 cf 47 00 	movl   $0x47cf,0x4(%esp)
     534:	00 
     535:	89 04 24             	mov    %eax,(%esp)
     538:	e8 3a 3c 00 00       	call   4177 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     53d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     540:	89 04 24             	mov    %eax,(%esp)
     543:	e8 c7 3a 00 00       	call   400f <close>

  if(unlink("small") < 0){
     548:	c7 04 24 f1 46 00 00 	movl   $0x46f1,(%esp)
     54f:	e8 e3 3a 00 00       	call   4037 <unlink>
     554:	85 c0                	test   %eax,%eax
     556:	79 36                	jns    58e <writetest+0x1fe>
     558:	eb 1a                	jmp    574 <writetest+0x1e4>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     55a:	a1 04 64 00 00       	mov    0x6404,%eax
     55f:	c7 44 24 04 e2 47 00 	movl   $0x47e2,0x4(%esp)
     566:	00 
     567:	89 04 24             	mov    %eax,(%esp)
     56a:	e8 08 3c 00 00       	call   4177 <printf>
    exit();
     56f:	e8 73 3a 00 00       	call   3fe7 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     574:	a1 04 64 00 00       	mov    0x6404,%eax
     579:	c7 44 24 04 ef 47 00 	movl   $0x47ef,0x4(%esp)
     580:	00 
     581:	89 04 24             	mov    %eax,(%esp)
     584:	e8 ee 3b 00 00       	call   4177 <printf>
    exit();
     589:	e8 59 3a 00 00       	call   3fe7 <exit>
  }
  printf(stdout, "small file test ok\n");
     58e:	a1 04 64 00 00       	mov    0x6404,%eax
     593:	c7 44 24 04 04 48 00 	movl   $0x4804,0x4(%esp)
     59a:	00 
     59b:	89 04 24             	mov    %eax,(%esp)
     59e:	e8 d4 3b 00 00       	call   4177 <printf>
}
     5a3:	c9                   	leave  
     5a4:	c3                   	ret    

000005a5 <writetest1>:

void
writetest1(void)
{
     5a5:	55                   	push   %ebp
     5a6:	89 e5                	mov    %esp,%ebp
     5a8:	83 ec 28             	sub    $0x28,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     5ab:	a1 04 64 00 00       	mov    0x6404,%eax
     5b0:	c7 44 24 04 18 48 00 	movl   $0x4818,0x4(%esp)
     5b7:	00 
     5b8:	89 04 24             	mov    %eax,(%esp)
     5bb:	e8 b7 3b 00 00       	call   4177 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     5c0:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     5c7:	00 
     5c8:	c7 04 24 28 48 00 00 	movl   $0x4828,(%esp)
     5cf:	e8 53 3a 00 00       	call   4027 <open>
     5d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     5d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5db:	79 1a                	jns    5f7 <writetest1+0x52>
    printf(stdout, "error: creat big failed!\n");
     5dd:	a1 04 64 00 00       	mov    0x6404,%eax
     5e2:	c7 44 24 04 2c 48 00 	movl   $0x482c,0x4(%esp)
     5e9:	00 
     5ea:	89 04 24             	mov    %eax,(%esp)
     5ed:	e8 85 3b 00 00       	call   4177 <printf>
    exit();
     5f2:	e8 f0 39 00 00       	call   3fe7 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     5f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     5fe:	eb 51                	jmp    651 <writetest1+0xac>
    ((int*)buf)[0] = i;
     600:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
     605:	8b 55 f4             	mov    -0xc(%ebp),%edx
     608:	89 10                	mov    %edx,(%eax)
    if(write(fd, buf, 512) != 512){
     60a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     611:	00 
     612:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     619:	00 
     61a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     61d:	89 04 24             	mov    %eax,(%esp)
     620:	e8 e2 39 00 00       	call   4007 <write>
     625:	3d 00 02 00 00       	cmp    $0x200,%eax
     62a:	74 21                	je     64d <writetest1+0xa8>
      printf(stdout, "error: write big file failed\n", i);
     62c:	a1 04 64 00 00       	mov    0x6404,%eax
     631:	8b 55 f4             	mov    -0xc(%ebp),%edx
     634:	89 54 24 08          	mov    %edx,0x8(%esp)
     638:	c7 44 24 04 46 48 00 	movl   $0x4846,0x4(%esp)
     63f:	00 
     640:	89 04 24             	mov    %eax,(%esp)
     643:	e8 2f 3b 00 00       	call   4177 <printf>
      exit();
     648:	e8 9a 39 00 00       	call   3fe7 <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     64d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     651:	8b 45 f4             	mov    -0xc(%ebp),%eax
     654:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     659:	76 a5                	jbe    600 <writetest1+0x5b>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     65b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     65e:	89 04 24             	mov    %eax,(%esp)
     661:	e8 a9 39 00 00       	call   400f <close>

  fd = open("big", O_RDONLY);
     666:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     66d:	00 
     66e:	c7 04 24 28 48 00 00 	movl   $0x4828,(%esp)
     675:	e8 ad 39 00 00       	call   4027 <open>
     67a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     67d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     681:	79 1a                	jns    69d <writetest1+0xf8>
    printf(stdout, "error: open big failed!\n");
     683:	a1 04 64 00 00       	mov    0x6404,%eax
     688:	c7 44 24 04 64 48 00 	movl   $0x4864,0x4(%esp)
     68f:	00 
     690:	89 04 24             	mov    %eax,(%esp)
     693:	e8 df 3a 00 00       	call   4177 <printf>
    exit();
     698:	e8 4a 39 00 00       	call   3fe7 <exit>
  }

  n = 0;
     69d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     6a4:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     6ab:	00 
     6ac:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     6b3:	00 
     6b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6b7:	89 04 24             	mov    %eax,(%esp)
     6ba:	e8 40 39 00 00       	call   3fff <read>
     6bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     6c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     6c6:	75 4c                	jne    714 <writetest1+0x16f>
      if(n == MAXFILE - 1){
     6c8:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     6cf:	75 21                	jne    6f2 <writetest1+0x14d>
        printf(stdout, "read only %d blocks from big", n);
     6d1:	a1 04 64 00 00       	mov    0x6404,%eax
     6d6:	8b 55 f0             	mov    -0x10(%ebp),%edx
     6d9:	89 54 24 08          	mov    %edx,0x8(%esp)
     6dd:	c7 44 24 04 7d 48 00 	movl   $0x487d,0x4(%esp)
     6e4:	00 
     6e5:	89 04 24             	mov    %eax,(%esp)
     6e8:	e8 8a 3a 00 00       	call   4177 <printf>
        exit();
     6ed:	e8 f5 38 00 00       	call   3fe7 <exit>
      }
      break;
     6f2:	90                   	nop
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     6f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6f6:	89 04 24             	mov    %eax,(%esp)
     6f9:	e8 11 39 00 00       	call   400f <close>
  if(unlink("big") < 0){
     6fe:	c7 04 24 28 48 00 00 	movl   $0x4828,(%esp)
     705:	e8 2d 39 00 00       	call   4037 <unlink>
     70a:	85 c0                	test   %eax,%eax
     70c:	0f 89 87 00 00 00    	jns    799 <writetest1+0x1f4>
     712:	eb 6b                	jmp    77f <writetest1+0x1da>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     714:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     71b:	74 21                	je     73e <writetest1+0x199>
      printf(stdout, "read failed %d\n", i);
     71d:	a1 04 64 00 00       	mov    0x6404,%eax
     722:	8b 55 f4             	mov    -0xc(%ebp),%edx
     725:	89 54 24 08          	mov    %edx,0x8(%esp)
     729:	c7 44 24 04 9a 48 00 	movl   $0x489a,0x4(%esp)
     730:	00 
     731:	89 04 24             	mov    %eax,(%esp)
     734:	e8 3e 3a 00 00       	call   4177 <printf>
      exit();
     739:	e8 a9 38 00 00       	call   3fe7 <exit>
    }
    if(((int*)buf)[0] != n){
     73e:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
     743:	8b 00                	mov    (%eax),%eax
     745:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     748:	74 2c                	je     776 <writetest1+0x1d1>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     74a:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     74f:	8b 10                	mov    (%eax),%edx
     751:	a1 04 64 00 00       	mov    0x6404,%eax
     756:	89 54 24 0c          	mov    %edx,0xc(%esp)
     75a:	8b 55 f0             	mov    -0x10(%ebp),%edx
     75d:	89 54 24 08          	mov    %edx,0x8(%esp)
     761:	c7 44 24 04 ac 48 00 	movl   $0x48ac,0x4(%esp)
     768:	00 
     769:	89 04 24             	mov    %eax,(%esp)
     76c:	e8 06 3a 00 00       	call   4177 <printf>
             n, ((int*)buf)[0]);
      exit();
     771:	e8 71 38 00 00       	call   3fe7 <exit>
    }
    n++;
     776:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }
     77a:	e9 25 ff ff ff       	jmp    6a4 <writetest1+0xff>
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     77f:	a1 04 64 00 00       	mov    0x6404,%eax
     784:	c7 44 24 04 cc 48 00 	movl   $0x48cc,0x4(%esp)
     78b:	00 
     78c:	89 04 24             	mov    %eax,(%esp)
     78f:	e8 e3 39 00 00       	call   4177 <printf>
    exit();
     794:	e8 4e 38 00 00       	call   3fe7 <exit>
  }
  printf(stdout, "big files ok\n");
     799:	a1 04 64 00 00       	mov    0x6404,%eax
     79e:	c7 44 24 04 df 48 00 	movl   $0x48df,0x4(%esp)
     7a5:	00 
     7a6:	89 04 24             	mov    %eax,(%esp)
     7a9:	e8 c9 39 00 00       	call   4177 <printf>
}
     7ae:	c9                   	leave  
     7af:	c3                   	ret    

000007b0 <createtest>:

void
createtest(void)
{
     7b0:	55                   	push   %ebp
     7b1:	89 e5                	mov    %esp,%ebp
     7b3:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     7b6:	a1 04 64 00 00       	mov    0x6404,%eax
     7bb:	c7 44 24 04 f0 48 00 	movl   $0x48f0,0x4(%esp)
     7c2:	00 
     7c3:	89 04 24             	mov    %eax,(%esp)
     7c6:	e8 ac 39 00 00       	call   4177 <printf>

  name[0] = 'a';
     7cb:	c6 05 e0 ab 00 00 61 	movb   $0x61,0xabe0
  name[2] = '\0';
     7d2:	c6 05 e2 ab 00 00 00 	movb   $0x0,0xabe2
  for(i = 0; i < 52; i++){
     7d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     7e0:	eb 31                	jmp    813 <createtest+0x63>
    name[1] = '0' + i;
     7e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7e5:	83 c0 30             	add    $0x30,%eax
     7e8:	a2 e1 ab 00 00       	mov    %al,0xabe1
    fd = open(name, O_CREATE|O_RDWR);
     7ed:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     7f4:	00 
     7f5:	c7 04 24 e0 ab 00 00 	movl   $0xabe0,(%esp)
     7fc:	e8 26 38 00 00       	call   4027 <open>
     801:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     804:	8b 45 f0             	mov    -0x10(%ebp),%eax
     807:	89 04 24             	mov    %eax,(%esp)
     80a:	e8 00 38 00 00       	call   400f <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     80f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     813:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     817:	7e c9                	jle    7e2 <createtest+0x32>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     819:	c6 05 e0 ab 00 00 61 	movb   $0x61,0xabe0
  name[2] = '\0';
     820:	c6 05 e2 ab 00 00 00 	movb   $0x0,0xabe2
  for(i = 0; i < 52; i++){
     827:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     82e:	eb 1b                	jmp    84b <createtest+0x9b>
    name[1] = '0' + i;
     830:	8b 45 f4             	mov    -0xc(%ebp),%eax
     833:	83 c0 30             	add    $0x30,%eax
     836:	a2 e1 ab 00 00       	mov    %al,0xabe1
    unlink(name);
     83b:	c7 04 24 e0 ab 00 00 	movl   $0xabe0,(%esp)
     842:	e8 f0 37 00 00       	call   4037 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     847:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     84b:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     84f:	7e df                	jle    830 <createtest+0x80>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     851:	a1 04 64 00 00       	mov    0x6404,%eax
     856:	c7 44 24 04 18 49 00 	movl   $0x4918,0x4(%esp)
     85d:	00 
     85e:	89 04 24             	mov    %eax,(%esp)
     861:	e8 11 39 00 00       	call   4177 <printf>
}
     866:	c9                   	leave  
     867:	c3                   	ret    

00000868 <dirtest>:

void dirtest(void)
{
     868:	55                   	push   %ebp
     869:	89 e5                	mov    %esp,%ebp
     86b:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
     86e:	a1 04 64 00 00       	mov    0x6404,%eax
     873:	c7 44 24 04 3e 49 00 	movl   $0x493e,0x4(%esp)
     87a:	00 
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 f4 38 00 00       	call   4177 <printf>

  if(mkdir("dir0") < 0){
     883:	c7 04 24 4a 49 00 00 	movl   $0x494a,(%esp)
     88a:	e8 c0 37 00 00       	call   404f <mkdir>
     88f:	85 c0                	test   %eax,%eax
     891:	79 1a                	jns    8ad <dirtest+0x45>
    printf(stdout, "mkdir failed\n");
     893:	a1 04 64 00 00       	mov    0x6404,%eax
     898:	c7 44 24 04 6d 45 00 	movl   $0x456d,0x4(%esp)
     89f:	00 
     8a0:	89 04 24             	mov    %eax,(%esp)
     8a3:	e8 cf 38 00 00       	call   4177 <printf>
    exit();
     8a8:	e8 3a 37 00 00       	call   3fe7 <exit>
  }

  if(chdir("dir0") < 0){
     8ad:	c7 04 24 4a 49 00 00 	movl   $0x494a,(%esp)
     8b4:	e8 9e 37 00 00       	call   4057 <chdir>
     8b9:	85 c0                	test   %eax,%eax
     8bb:	79 1a                	jns    8d7 <dirtest+0x6f>
    printf(stdout, "chdir dir0 failed\n");
     8bd:	a1 04 64 00 00       	mov    0x6404,%eax
     8c2:	c7 44 24 04 4f 49 00 	movl   $0x494f,0x4(%esp)
     8c9:	00 
     8ca:	89 04 24             	mov    %eax,(%esp)
     8cd:	e8 a5 38 00 00       	call   4177 <printf>
    exit();
     8d2:	e8 10 37 00 00       	call   3fe7 <exit>
  }

  if(chdir("..") < 0){
     8d7:	c7 04 24 62 49 00 00 	movl   $0x4962,(%esp)
     8de:	e8 74 37 00 00       	call   4057 <chdir>
     8e3:	85 c0                	test   %eax,%eax
     8e5:	79 1a                	jns    901 <dirtest+0x99>
    printf(stdout, "chdir .. failed\n");
     8e7:	a1 04 64 00 00       	mov    0x6404,%eax
     8ec:	c7 44 24 04 65 49 00 	movl   $0x4965,0x4(%esp)
     8f3:	00 
     8f4:	89 04 24             	mov    %eax,(%esp)
     8f7:	e8 7b 38 00 00       	call   4177 <printf>
    exit();
     8fc:	e8 e6 36 00 00       	call   3fe7 <exit>
  }

  if(unlink("dir0") < 0){
     901:	c7 04 24 4a 49 00 00 	movl   $0x494a,(%esp)
     908:	e8 2a 37 00 00       	call   4037 <unlink>
     90d:	85 c0                	test   %eax,%eax
     90f:	79 1a                	jns    92b <dirtest+0xc3>
    printf(stdout, "unlink dir0 failed\n");
     911:	a1 04 64 00 00       	mov    0x6404,%eax
     916:	c7 44 24 04 76 49 00 	movl   $0x4976,0x4(%esp)
     91d:	00 
     91e:	89 04 24             	mov    %eax,(%esp)
     921:	e8 51 38 00 00       	call   4177 <printf>
    exit();
     926:	e8 bc 36 00 00       	call   3fe7 <exit>
  }
  printf(stdout, "mkdir test ok\n");
     92b:	a1 04 64 00 00       	mov    0x6404,%eax
     930:	c7 44 24 04 8a 49 00 	movl   $0x498a,0x4(%esp)
     937:	00 
     938:	89 04 24             	mov    %eax,(%esp)
     93b:	e8 37 38 00 00       	call   4177 <printf>
}
     940:	c9                   	leave  
     941:	c3                   	ret    

00000942 <exectest>:

void
exectest(void)
{
     942:	55                   	push   %ebp
     943:	89 e5                	mov    %esp,%ebp
     945:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
     948:	a1 04 64 00 00       	mov    0x6404,%eax
     94d:	c7 44 24 04 99 49 00 	movl   $0x4999,0x4(%esp)
     954:	00 
     955:	89 04 24             	mov    %eax,(%esp)
     958:	e8 1a 38 00 00       	call   4177 <printf>
  if(exec("echo", echoargv) < 0){
     95d:	c7 44 24 04 f0 63 00 	movl   $0x63f0,0x4(%esp)
     964:	00 
     965:	c7 04 24 44 45 00 00 	movl   $0x4544,(%esp)
     96c:	e8 ae 36 00 00       	call   401f <exec>
     971:	85 c0                	test   %eax,%eax
     973:	79 1a                	jns    98f <exectest+0x4d>
    printf(stdout, "exec echo failed\n");
     975:	a1 04 64 00 00       	mov    0x6404,%eax
     97a:	c7 44 24 04 a4 49 00 	movl   $0x49a4,0x4(%esp)
     981:	00 
     982:	89 04 24             	mov    %eax,(%esp)
     985:	e8 ed 37 00 00       	call   4177 <printf>
    exit();
     98a:	e8 58 36 00 00       	call   3fe7 <exit>
  }
}
     98f:	c9                   	leave  
     990:	c3                   	ret    

00000991 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     991:	55                   	push   %ebp
     992:	89 e5                	mov    %esp,%ebp
     994:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     997:	8d 45 d8             	lea    -0x28(%ebp),%eax
     99a:	89 04 24             	mov    %eax,(%esp)
     99d:	e8 55 36 00 00       	call   3ff7 <pipe>
     9a2:	85 c0                	test   %eax,%eax
     9a4:	74 19                	je     9bf <pipe1+0x2e>
    printf(1, "pipe() failed\n");
     9a6:	c7 44 24 04 b6 49 00 	movl   $0x49b6,0x4(%esp)
     9ad:	00 
     9ae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9b5:	e8 bd 37 00 00       	call   4177 <printf>
    exit();
     9ba:	e8 28 36 00 00       	call   3fe7 <exit>
  }
  pid = fork(0,0);
     9bf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     9c6:	00 
     9c7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     9ce:	e8 0c 36 00 00       	call   3fdf <fork>
     9d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     9d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     9dd:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     9e1:	0f 85 88 00 00 00    	jne    a6f <pipe1+0xde>
    close(fds[0]);
     9e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
     9ea:	89 04 24             	mov    %eax,(%esp)
     9ed:	e8 1d 36 00 00       	call   400f <close>
    for(n = 0; n < 5; n++){
     9f2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     9f9:	eb 69                	jmp    a64 <pipe1+0xd3>
      for(i = 0; i < 1033; i++)
     9fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     a02:	eb 18                	jmp    a1c <pipe1+0x8b>
        buf[i] = seq++;
     a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a07:	8d 50 01             	lea    0x1(%eax),%edx
     a0a:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a0d:	8b 55 f0             	mov    -0x10(%ebp),%edx
     a10:	81 c2 e0 8b 00 00    	add    $0x8be0,%edx
     a16:	88 02                	mov    %al,(%edx)
  pid = fork(0,0);
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     a18:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     a1c:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     a23:	7e df                	jle    a04 <pipe1+0x73>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     a25:	8b 45 dc             	mov    -0x24(%ebp),%eax
     a28:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
     a2f:	00 
     a30:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     a37:	00 
     a38:	89 04 24             	mov    %eax,(%esp)
     a3b:	e8 c7 35 00 00       	call   4007 <write>
     a40:	3d 09 04 00 00       	cmp    $0x409,%eax
     a45:	74 19                	je     a60 <pipe1+0xcf>
        printf(1, "pipe1 oops 1\n");
     a47:	c7 44 24 04 c5 49 00 	movl   $0x49c5,0x4(%esp)
     a4e:	00 
     a4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a56:	e8 1c 37 00 00       	call   4177 <printf>
        exit();
     a5b:	e8 87 35 00 00       	call   3fe7 <exit>
  }
  pid = fork(0,0);
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     a60:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     a64:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     a68:	7e 91                	jle    9fb <pipe1+0x6a>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     a6a:	e8 78 35 00 00       	call   3fe7 <exit>
  } else if(pid > 0){
     a6f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     a73:	0f 8e f9 00 00 00    	jle    b72 <pipe1+0x1e1>
    close(fds[1]);
     a79:	8b 45 dc             	mov    -0x24(%ebp),%eax
     a7c:	89 04 24             	mov    %eax,(%esp)
     a7f:	e8 8b 35 00 00       	call   400f <close>
    total = 0;
     a84:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     a8b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     a92:	eb 68                	jmp    afc <pipe1+0x16b>
      for(i = 0; i < n; i++){
     a94:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     a9b:	eb 3d                	jmp    ada <pipe1+0x149>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     aa0:	05 e0 8b 00 00       	add    $0x8be0,%eax
     aa5:	0f b6 00             	movzbl (%eax),%eax
     aa8:	0f be c8             	movsbl %al,%ecx
     aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aae:	8d 50 01             	lea    0x1(%eax),%edx
     ab1:	89 55 f4             	mov    %edx,-0xc(%ebp)
     ab4:	31 c8                	xor    %ecx,%eax
     ab6:	0f b6 c0             	movzbl %al,%eax
     ab9:	85 c0                	test   %eax,%eax
     abb:	74 19                	je     ad6 <pipe1+0x145>
          printf(1, "pipe1 oops 2\n");
     abd:	c7 44 24 04 d3 49 00 	movl   $0x49d3,0x4(%esp)
     ac4:	00 
     ac5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     acc:	e8 a6 36 00 00       	call   4177 <printf>
     ad1:	e9 b5 00 00 00       	jmp    b8b <pipe1+0x1fa>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     ad6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     ada:	8b 45 f0             	mov    -0x10(%ebp),%eax
     add:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     ae0:	7c bb                	jl     a9d <pipe1+0x10c>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     ae2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     ae5:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     ae8:	d1 65 e8             	shll   -0x18(%ebp)
      if(cc > sizeof(buf))
     aeb:	8b 45 e8             	mov    -0x18(%ebp),%eax
     aee:	3d 00 20 00 00       	cmp    $0x2000,%eax
     af3:	76 07                	jbe    afc <pipe1+0x16b>
        cc = sizeof(buf);
     af5:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     afc:	8b 45 d8             	mov    -0x28(%ebp),%eax
     aff:	8b 55 e8             	mov    -0x18(%ebp),%edx
     b02:	89 54 24 08          	mov    %edx,0x8(%esp)
     b06:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     b0d:	00 
     b0e:	89 04 24             	mov    %eax,(%esp)
     b11:	e8 e9 34 00 00       	call   3fff <read>
     b16:	89 45 ec             	mov    %eax,-0x14(%ebp)
     b19:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     b1d:	0f 8f 71 ff ff ff    	jg     a94 <pipe1+0x103>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b23:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     b2a:	74 20                	je     b4c <pipe1+0x1bb>
      printf(1, "pipe1 oops 3 total %d\n", total);
     b2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     b2f:	89 44 24 08          	mov    %eax,0x8(%esp)
     b33:	c7 44 24 04 e1 49 00 	movl   $0x49e1,0x4(%esp)
     b3a:	00 
     b3b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b42:	e8 30 36 00 00       	call   4177 <printf>
      exit();
     b47:	e8 9b 34 00 00       	call   3fe7 <exit>
    }
    close(fds[0]);
     b4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
     b4f:	89 04 24             	mov    %eax,(%esp)
     b52:	e8 b8 34 00 00       	call   400f <close>
    wait();
     b57:	e8 93 34 00 00       	call   3fef <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b5c:	c7 44 24 04 07 4a 00 	movl   $0x4a07,0x4(%esp)
     b63:	00 
     b64:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b6b:	e8 07 36 00 00       	call   4177 <printf>
     b70:	eb 19                	jmp    b8b <pipe1+0x1fa>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b72:	c7 44 24 04 f8 49 00 	movl   $0x49f8,0x4(%esp)
     b79:	00 
     b7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b81:	e8 f1 35 00 00       	call   4177 <printf>
    exit();
     b86:	e8 5c 34 00 00       	call   3fe7 <exit>
  }
  printf(1, "pipe1 ok\n");
}
     b8b:	c9                   	leave  
     b8c:	c3                   	ret    

00000b8d <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     b8d:	55                   	push   %ebp
     b8e:	89 e5                	mov    %esp,%ebp
     b90:	83 ec 38             	sub    $0x38,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     b93:	c7 44 24 04 11 4a 00 	movl   $0x4a11,0x4(%esp)
     b9a:	00 
     b9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ba2:	e8 d0 35 00 00       	call   4177 <printf>
  pid1 = fork(0,0);
     ba7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     bae:	00 
     baf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     bb6:	e8 24 34 00 00       	call   3fdf <fork>
     bbb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     bbe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bc2:	75 02                	jne    bc6 <preempt+0x39>
    for(;;)
      ;
     bc4:	eb fe                	jmp    bc4 <preempt+0x37>

  pid2 = fork(0,0);
     bc6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     bcd:	00 
     bce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     bd5:	e8 05 34 00 00       	call   3fdf <fork>
     bda:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     bdd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     be1:	75 02                	jne    be5 <preempt+0x58>
    for(;;)
      ;
     be3:	eb fe                	jmp    be3 <preempt+0x56>

  pipe(pfds);
     be5:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     be8:	89 04 24             	mov    %eax,(%esp)
     beb:	e8 07 34 00 00       	call   3ff7 <pipe>
  pid3 = fork(0,0);
     bf0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     bf7:	00 
     bf8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     bff:	e8 db 33 00 00       	call   3fdf <fork>
     c04:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     c07:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     c0b:	75 4c                	jne    c59 <preempt+0xcc>
    close(pfds[0]);
     c0d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c10:	89 04 24             	mov    %eax,(%esp)
     c13:	e8 f7 33 00 00       	call   400f <close>
    if(write(pfds[1], "x", 1) != 1)
     c18:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c1b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     c22:	00 
     c23:	c7 44 24 04 1b 4a 00 	movl   $0x4a1b,0x4(%esp)
     c2a:	00 
     c2b:	89 04 24             	mov    %eax,(%esp)
     c2e:	e8 d4 33 00 00       	call   4007 <write>
     c33:	83 f8 01             	cmp    $0x1,%eax
     c36:	74 14                	je     c4c <preempt+0xbf>
      printf(1, "preempt write error");
     c38:	c7 44 24 04 1d 4a 00 	movl   $0x4a1d,0x4(%esp)
     c3f:	00 
     c40:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c47:	e8 2b 35 00 00       	call   4177 <printf>
    close(pfds[1]);
     c4c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c4f:	89 04 24             	mov    %eax,(%esp)
     c52:	e8 b8 33 00 00       	call   400f <close>
    for(;;)
      ;
     c57:	eb fe                	jmp    c57 <preempt+0xca>
  }

  close(pfds[1]);
     c59:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c5c:	89 04 24             	mov    %eax,(%esp)
     c5f:	e8 ab 33 00 00       	call   400f <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c67:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     c6e:	00 
     c6f:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     c76:	00 
     c77:	89 04 24             	mov    %eax,(%esp)
     c7a:	e8 80 33 00 00       	call   3fff <read>
     c7f:	83 f8 01             	cmp    $0x1,%eax
     c82:	74 16                	je     c9a <preempt+0x10d>
    printf(1, "preempt read error");
     c84:	c7 44 24 04 31 4a 00 	movl   $0x4a31,0x4(%esp)
     c8b:	00 
     c8c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c93:	e8 df 34 00 00       	call   4177 <printf>
     c98:	eb 77                	jmp    d11 <preempt+0x184>
    return;
  }
  close(pfds[0]);
     c9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c9d:	89 04 24             	mov    %eax,(%esp)
     ca0:	e8 6a 33 00 00       	call   400f <close>
  printf(1, "kill... ");
     ca5:	c7 44 24 04 44 4a 00 	movl   $0x4a44,0x4(%esp)
     cac:	00 
     cad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     cb4:	e8 be 34 00 00       	call   4177 <printf>
  kill(pid1);
     cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cbc:	89 04 24             	mov    %eax,(%esp)
     cbf:	e8 53 33 00 00       	call   4017 <kill>
  kill(pid2);
     cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cc7:	89 04 24             	mov    %eax,(%esp)
     cca:	e8 48 33 00 00       	call   4017 <kill>
  kill(pid3);
     ccf:	8b 45 ec             	mov    -0x14(%ebp),%eax
     cd2:	89 04 24             	mov    %eax,(%esp)
     cd5:	e8 3d 33 00 00       	call   4017 <kill>
  printf(1, "wait... ");
     cda:	c7 44 24 04 4d 4a 00 	movl   $0x4a4d,0x4(%esp)
     ce1:	00 
     ce2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ce9:	e8 89 34 00 00       	call   4177 <printf>
  wait();
     cee:	e8 fc 32 00 00       	call   3fef <wait>
  wait();
     cf3:	e8 f7 32 00 00       	call   3fef <wait>
  wait();
     cf8:	e8 f2 32 00 00       	call   3fef <wait>
  printf(1, "preempt ok\n");
     cfd:	c7 44 24 04 56 4a 00 	movl   $0x4a56,0x4(%esp)
     d04:	00 
     d05:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d0c:	e8 66 34 00 00       	call   4177 <printf>
}
     d11:	c9                   	leave  
     d12:	c3                   	ret    

00000d13 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     d13:	55                   	push   %ebp
     d14:	89 e5                	mov    %esp,%ebp
     d16:	83 ec 28             	sub    $0x28,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     d19:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d20:	eb 62                	jmp    d84 <exitwait+0x71>
    pid = fork(0,0);
     d22:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     d29:	00 
     d2a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d31:	e8 a9 32 00 00       	call   3fdf <fork>
     d36:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     d39:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d3d:	79 16                	jns    d55 <exitwait+0x42>
      printf(1, "fork failed\n");
     d3f:	c7 44 24 04 e5 45 00 	movl   $0x45e5,0x4(%esp)
     d46:	00 
     d47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d4e:	e8 24 34 00 00       	call   4177 <printf>
      return;
     d53:	eb 49                	jmp    d9e <exitwait+0x8b>
    }
    if(pid){
     d55:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d59:	74 20                	je     d7b <exitwait+0x68>
      if(wait() != pid){
     d5b:	e8 8f 32 00 00       	call   3fef <wait>
     d60:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     d63:	74 1b                	je     d80 <exitwait+0x6d>
        printf(1, "wait wrong pid\n");
     d65:	c7 44 24 04 62 4a 00 	movl   $0x4a62,0x4(%esp)
     d6c:	00 
     d6d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d74:	e8 fe 33 00 00       	call   4177 <printf>
        return;
     d79:	eb 23                	jmp    d9e <exitwait+0x8b>
      }
    } else {
      exit();
     d7b:	e8 67 32 00 00       	call   3fe7 <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     d80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     d84:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     d88:	7e 98                	jle    d22 <exitwait+0xf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d8a:	c7 44 24 04 72 4a 00 	movl   $0x4a72,0x4(%esp)
     d91:	00 
     d92:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d99:	e8 d9 33 00 00       	call   4177 <printf>
}
     d9e:	c9                   	leave  
     d9f:	c3                   	ret    

00000da0 <mem>:

void
mem(void)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	83 ec 28             	sub    $0x28,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     da6:	c7 44 24 04 7f 4a 00 	movl   $0x4a7f,0x4(%esp)
     dad:	00 
     dae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     db5:	e8 bd 33 00 00       	call   4177 <printf>
  ppid = getpid();
     dba:	e8 a8 32 00 00       	call   4067 <getpid>
     dbf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork(0,0)) == 0){
     dc2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     dc9:	00 
     dca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     dd1:	e8 09 32 00 00       	call   3fdf <fork>
     dd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
     dd9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     ddd:	0f 85 aa 00 00 00    	jne    e8d <mem+0xed>
    m1 = 0;
     de3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     dea:	eb 0e                	jmp    dfa <mem+0x5a>
      *(char**)m2 = m1;
     dec:	8b 45 e8             	mov    -0x18(%ebp),%eax
     def:	8b 55 f4             	mov    -0xc(%ebp),%edx
     df2:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     df4:	8b 45 e8             	mov    -0x18(%ebp),%eax
     df7:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork(0,0)) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     dfa:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
     e01:	e8 5d 36 00 00       	call   4463 <malloc>
     e06:	89 45 e8             	mov    %eax,-0x18(%ebp)
     e09:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     e0d:	75 dd                	jne    dec <mem+0x4c>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e0f:	eb 19                	jmp    e2a <mem+0x8a>
      m2 = *(char**)m1;
     e11:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e14:	8b 00                	mov    (%eax),%eax
     e16:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     e19:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e1c:	89 04 24             	mov    %eax,(%esp)
     e1f:	e8 06 35 00 00       	call   432a <free>
      m1 = m2;
     e24:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e27:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e2a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e2e:	75 e1                	jne    e11 <mem+0x71>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     e30:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
     e37:	e8 27 36 00 00       	call   4463 <malloc>
     e3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     e3f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e43:	75 24                	jne    e69 <mem+0xc9>
      printf(1, "couldn't allocate mem?!!\n");
     e45:	c7 44 24 04 89 4a 00 	movl   $0x4a89,0x4(%esp)
     e4c:	00 
     e4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e54:	e8 1e 33 00 00       	call   4177 <printf>
      kill(ppid);
     e59:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e5c:	89 04 24             	mov    %eax,(%esp)
     e5f:	e8 b3 31 00 00       	call   4017 <kill>
      exit();
     e64:	e8 7e 31 00 00       	call   3fe7 <exit>
    }
    free(m1);
     e69:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e6c:	89 04 24             	mov    %eax,(%esp)
     e6f:	e8 b6 34 00 00       	call   432a <free>
    printf(1, "mem ok\n");
     e74:	c7 44 24 04 a3 4a 00 	movl   $0x4aa3,0x4(%esp)
     e7b:	00 
     e7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e83:	e8 ef 32 00 00       	call   4177 <printf>
    exit();
     e88:	e8 5a 31 00 00       	call   3fe7 <exit>
  } else {
    wait();
     e8d:	e8 5d 31 00 00       	call   3fef <wait>
  }
}
     e92:	c9                   	leave  
     e93:	c3                   	ret    

00000e94 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e94:	55                   	push   %ebp
     e95:	89 e5                	mov    %esp,%ebp
     e97:	83 ec 48             	sub    $0x48,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e9a:	c7 44 24 04 ab 4a 00 	movl   $0x4aab,0x4(%esp)
     ea1:	00 
     ea2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ea9:	e8 c9 32 00 00       	call   4177 <printf>

  unlink("sharedfd");
     eae:	c7 04 24 ba 4a 00 00 	movl   $0x4aba,(%esp)
     eb5:	e8 7d 31 00 00       	call   4037 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     eba:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     ec1:	00 
     ec2:	c7 04 24 ba 4a 00 00 	movl   $0x4aba,(%esp)
     ec9:	e8 59 31 00 00       	call   4027 <open>
     ece:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     ed1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     ed5:	79 19                	jns    ef0 <sharedfd+0x5c>
    printf(1, "fstests: cannot open sharedfd for writing");
     ed7:	c7 44 24 04 c4 4a 00 	movl   $0x4ac4,0x4(%esp)
     ede:	00 
     edf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ee6:	e8 8c 32 00 00       	call   4177 <printf>
    return;
     eeb:	e9 af 01 00 00       	jmp    109f <sharedfd+0x20b>
  }
  pid = fork(0,0);
     ef0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ef7:	00 
     ef8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     eff:	e8 db 30 00 00       	call   3fdf <fork>
     f04:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     f07:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     f0b:	75 07                	jne    f14 <sharedfd+0x80>
     f0d:	b8 63 00 00 00       	mov    $0x63,%eax
     f12:	eb 05                	jmp    f19 <sharedfd+0x85>
     f14:	b8 70 00 00 00       	mov    $0x70,%eax
     f19:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     f20:	00 
     f21:	89 44 24 04          	mov    %eax,0x4(%esp)
     f25:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     f28:	89 04 24             	mov    %eax,(%esp)
     f2b:	e8 0a 2f 00 00       	call   3e3a <memset>
  for(i = 0; i < 1000; i++){
     f30:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f37:	eb 39                	jmp    f72 <sharedfd+0xde>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     f39:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     f40:	00 
     f41:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     f44:	89 44 24 04          	mov    %eax,0x4(%esp)
     f48:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f4b:	89 04 24             	mov    %eax,(%esp)
     f4e:	e8 b4 30 00 00       	call   4007 <write>
     f53:	83 f8 0a             	cmp    $0xa,%eax
     f56:	74 16                	je     f6e <sharedfd+0xda>
      printf(1, "fstests: write sharedfd failed\n");
     f58:	c7 44 24 04 f0 4a 00 	movl   $0x4af0,0x4(%esp)
     f5f:	00 
     f60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f67:	e8 0b 32 00 00       	call   4177 <printf>
      break;
     f6c:	eb 0d                	jmp    f7b <sharedfd+0xe7>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork(0,0);
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     f6e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f72:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     f79:	7e be                	jle    f39 <sharedfd+0xa5>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     f7b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     f7f:	75 05                	jne    f86 <sharedfd+0xf2>
    exit();
     f81:	e8 61 30 00 00       	call   3fe7 <exit>
  else
    wait();
     f86:	e8 64 30 00 00       	call   3fef <wait>
  close(fd);
     f8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f8e:	89 04 24             	mov    %eax,(%esp)
     f91:	e8 79 30 00 00       	call   400f <close>
  fd = open("sharedfd", 0);
     f96:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     f9d:	00 
     f9e:	c7 04 24 ba 4a 00 00 	movl   $0x4aba,(%esp)
     fa5:	e8 7d 30 00 00       	call   4027 <open>
     faa:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     fad:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     fb1:	79 19                	jns    fcc <sharedfd+0x138>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fb3:	c7 44 24 04 10 4b 00 	movl   $0x4b10,0x4(%esp)
     fba:	00 
     fbb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     fc2:	e8 b0 31 00 00       	call   4177 <printf>
    return;
     fc7:	e9 d3 00 00 00       	jmp    109f <sharedfd+0x20b>
  }
  nc = np = 0;
     fcc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     fd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
     fd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     fd9:	eb 3b                	jmp    1016 <sharedfd+0x182>
    for(i = 0; i < sizeof(buf); i++){
     fdb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fe2:	eb 2a                	jmp    100e <sharedfd+0x17a>
      if(buf[i] == 'c')
     fe4:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     fe7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fea:	01 d0                	add    %edx,%eax
     fec:	0f b6 00             	movzbl (%eax),%eax
     fef:	3c 63                	cmp    $0x63,%al
     ff1:	75 04                	jne    ff7 <sharedfd+0x163>
        nc++;
     ff3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
     ff7:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ffd:	01 d0                	add    %edx,%eax
     fff:	0f b6 00             	movzbl (%eax),%eax
    1002:	3c 70                	cmp    $0x70,%al
    1004:	75 04                	jne    100a <sharedfd+0x176>
        np++;
    1006:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
    100a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    100e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1011:	83 f8 09             	cmp    $0x9,%eax
    1014:	76 ce                	jbe    fe4 <sharedfd+0x150>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1016:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    101d:	00 
    101e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    1021:	89 44 24 04          	mov    %eax,0x4(%esp)
    1025:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1028:	89 04 24             	mov    %eax,(%esp)
    102b:	e8 cf 2f 00 00       	call   3fff <read>
    1030:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1033:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1037:	7f a2                	jg     fdb <sharedfd+0x147>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
    1039:	8b 45 e8             	mov    -0x18(%ebp),%eax
    103c:	89 04 24             	mov    %eax,(%esp)
    103f:	e8 cb 2f 00 00       	call   400f <close>
  unlink("sharedfd");
    1044:	c7 04 24 ba 4a 00 00 	movl   $0x4aba,(%esp)
    104b:	e8 e7 2f 00 00       	call   4037 <unlink>
  if(nc == 10000 && np == 10000){
    1050:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
    1057:	75 1f                	jne    1078 <sharedfd+0x1e4>
    1059:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
    1060:	75 16                	jne    1078 <sharedfd+0x1e4>
    printf(1, "sharedfd ok\n");
    1062:	c7 44 24 04 3b 4b 00 	movl   $0x4b3b,0x4(%esp)
    1069:	00 
    106a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1071:	e8 01 31 00 00       	call   4177 <printf>
    1076:	eb 27                	jmp    109f <sharedfd+0x20b>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1078:	8b 45 ec             	mov    -0x14(%ebp),%eax
    107b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    107f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1082:	89 44 24 08          	mov    %eax,0x8(%esp)
    1086:	c7 44 24 04 48 4b 00 	movl   $0x4b48,0x4(%esp)
    108d:	00 
    108e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1095:	e8 dd 30 00 00       	call   4177 <printf>
    exit();
    109a:	e8 48 2f 00 00       	call   3fe7 <exit>
  }
}
    109f:	c9                   	leave  
    10a0:	c3                   	ret    

000010a1 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    10a1:	55                   	push   %ebp
    10a2:	89 e5                	mov    %esp,%ebp
    10a4:	83 ec 48             	sub    $0x48,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    10a7:	c7 45 c8 5d 4b 00 00 	movl   $0x4b5d,-0x38(%ebp)
    10ae:	c7 45 cc 60 4b 00 00 	movl   $0x4b60,-0x34(%ebp)
    10b5:	c7 45 d0 63 4b 00 00 	movl   $0x4b63,-0x30(%ebp)
    10bc:	c7 45 d4 66 4b 00 00 	movl   $0x4b66,-0x2c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    10c3:	c7 44 24 04 69 4b 00 	movl   $0x4b69,0x4(%esp)
    10ca:	00 
    10cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10d2:	e8 a0 30 00 00       	call   4177 <printf>

  for(pi = 0; pi < 4; pi++){
    10d7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    10de:	e9 0b 01 00 00       	jmp    11ee <fourfiles+0x14d>
    fname = names[pi];
    10e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10e6:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    10ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    unlink(fname);
    10ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10f0:	89 04 24             	mov    %eax,(%esp)
    10f3:	e8 3f 2f 00 00       	call   4037 <unlink>

    pid = fork(0,0);
    10f8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10ff:	00 
    1100:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1107:	e8 d3 2e 00 00       	call   3fdf <fork>
    110c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(pid < 0){
    110f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1113:	79 19                	jns    112e <fourfiles+0x8d>
      printf(1, "fork failed\n");
    1115:	c7 44 24 04 e5 45 00 	movl   $0x45e5,0x4(%esp)
    111c:	00 
    111d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1124:	e8 4e 30 00 00       	call   4177 <printf>
      exit();
    1129:	e8 b9 2e 00 00       	call   3fe7 <exit>
    }

    if(pid == 0){
    112e:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1132:	0f 85 b2 00 00 00    	jne    11ea <fourfiles+0x149>
      fd = open(fname, O_CREATE | O_RDWR);
    1138:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    113f:	00 
    1140:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1143:	89 04 24             	mov    %eax,(%esp)
    1146:	e8 dc 2e 00 00       	call   4027 <open>
    114b:	89 45 dc             	mov    %eax,-0x24(%ebp)
      if(fd < 0){
    114e:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1152:	79 19                	jns    116d <fourfiles+0xcc>
        printf(1, "create failed\n");
    1154:	c7 44 24 04 79 4b 00 	movl   $0x4b79,0x4(%esp)
    115b:	00 
    115c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1163:	e8 0f 30 00 00       	call   4177 <printf>
        exit();
    1168:	e8 7a 2e 00 00       	call   3fe7 <exit>
      }
      
      memset(buf, '0'+pi, 512);
    116d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1170:	83 c0 30             	add    $0x30,%eax
    1173:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    117a:	00 
    117b:	89 44 24 04          	mov    %eax,0x4(%esp)
    117f:	c7 04 24 e0 8b 00 00 	movl   $0x8be0,(%esp)
    1186:	e8 af 2c 00 00       	call   3e3a <memset>
      for(i = 0; i < 12; i++){
    118b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1192:	eb 4b                	jmp    11df <fourfiles+0x13e>
        if((n = write(fd, buf, 500)) != 500){
    1194:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
    119b:	00 
    119c:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    11a3:	00 
    11a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    11a7:	89 04 24             	mov    %eax,(%esp)
    11aa:	e8 58 2e 00 00       	call   4007 <write>
    11af:	89 45 d8             	mov    %eax,-0x28(%ebp)
    11b2:	81 7d d8 f4 01 00 00 	cmpl   $0x1f4,-0x28(%ebp)
    11b9:	74 20                	je     11db <fourfiles+0x13a>
          printf(1, "write failed %d\n", n);
    11bb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    11be:	89 44 24 08          	mov    %eax,0x8(%esp)
    11c2:	c7 44 24 04 88 4b 00 	movl   $0x4b88,0x4(%esp)
    11c9:	00 
    11ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11d1:	e8 a1 2f 00 00       	call   4177 <printf>
          exit();
    11d6:	e8 0c 2e 00 00       	call   3fe7 <exit>
        printf(1, "create failed\n");
        exit();
      }
      
      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    11db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    11df:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    11e3:	7e af                	jle    1194 <fourfiles+0xf3>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    11e5:	e8 fd 2d 00 00       	call   3fe7 <exit>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    11ea:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    11ee:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
    11f2:	0f 8e eb fe ff ff    	jle    10e3 <fourfiles+0x42>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    11f8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    11ff:	eb 09                	jmp    120a <fourfiles+0x169>
    wait();
    1201:	e8 e9 2d 00 00       	call   3fef <wait>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    1206:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    120a:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
    120e:	7e f1                	jle    1201 <fourfiles+0x160>
    wait();
  }

  for(i = 0; i < 2; i++){
    1210:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1217:	e9 dc 00 00 00       	jmp    12f8 <fourfiles+0x257>
    fname = names[i];
    121c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    121f:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    1223:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    fd = open(fname, 0);
    1226:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    122d:	00 
    122e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1231:	89 04 24             	mov    %eax,(%esp)
    1234:	e8 ee 2d 00 00       	call   4027 <open>
    1239:	89 45 dc             	mov    %eax,-0x24(%ebp)
    total = 0;
    123c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1243:	eb 4c                	jmp    1291 <fourfiles+0x1f0>
      for(j = 0; j < n; j++){
    1245:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    124c:	eb 35                	jmp    1283 <fourfiles+0x1e2>
        if(buf[j] != '0'+i){
    124e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1251:	05 e0 8b 00 00       	add    $0x8be0,%eax
    1256:	0f b6 00             	movzbl (%eax),%eax
    1259:	0f be c0             	movsbl %al,%eax
    125c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    125f:	83 c2 30             	add    $0x30,%edx
    1262:	39 d0                	cmp    %edx,%eax
    1264:	74 19                	je     127f <fourfiles+0x1de>
          printf(1, "wrong char\n");
    1266:	c7 44 24 04 99 4b 00 	movl   $0x4b99,0x4(%esp)
    126d:	00 
    126e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1275:	e8 fd 2e 00 00       	call   4177 <printf>
          exit();
    127a:	e8 68 2d 00 00       	call   3fe7 <exit>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    127f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1283:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1286:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    1289:	7c c3                	jl     124e <fourfiles+0x1ad>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    128b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    128e:	01 45 ec             	add    %eax,-0x14(%ebp)

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1291:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1298:	00 
    1299:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    12a0:	00 
    12a1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    12a4:	89 04 24             	mov    %eax,(%esp)
    12a7:	e8 53 2d 00 00       	call   3fff <read>
    12ac:	89 45 d8             	mov    %eax,-0x28(%ebp)
    12af:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    12b3:	7f 90                	jg     1245 <fourfiles+0x1a4>
          exit();
        }
      }
      total += n;
    }
    close(fd);
    12b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    12b8:	89 04 24             	mov    %eax,(%esp)
    12bb:	e8 4f 2d 00 00       	call   400f <close>
    if(total != 12*500){
    12c0:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
    12c7:	74 20                	je     12e9 <fourfiles+0x248>
      printf(1, "wrong length %d\n", total);
    12c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12cc:	89 44 24 08          	mov    %eax,0x8(%esp)
    12d0:	c7 44 24 04 a5 4b 00 	movl   $0x4ba5,0x4(%esp)
    12d7:	00 
    12d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12df:	e8 93 2e 00 00       	call   4177 <printf>
      exit();
    12e4:	e8 fe 2c 00 00       	call   3fe7 <exit>
    }
    unlink(fname);
    12e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12ec:	89 04 24             	mov    %eax,(%esp)
    12ef:	e8 43 2d 00 00       	call   4037 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    12f4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    12f8:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    12fc:	0f 8e 1a ff ff ff    	jle    121c <fourfiles+0x17b>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    1302:	c7 44 24 04 b6 4b 00 	movl   $0x4bb6,0x4(%esp)
    1309:	00 
    130a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1311:	e8 61 2e 00 00       	call   4177 <printf>
}
    1316:	c9                   	leave  
    1317:	c3                   	ret    

00001318 <createdelete>:

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1318:	55                   	push   %ebp
    1319:	89 e5                	mov    %esp,%ebp
    131b:	83 ec 48             	sub    $0x48,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    131e:	c7 44 24 04 c4 4b 00 	movl   $0x4bc4,0x4(%esp)
    1325:	00 
    1326:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    132d:	e8 45 2e 00 00       	call   4177 <printf>

  for(pi = 0; pi < 4; pi++){
    1332:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1339:	e9 03 01 00 00       	jmp    1441 <createdelete+0x129>
    pid = fork(0,0);
    133e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1345:	00 
    1346:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    134d:	e8 8d 2c 00 00       	call   3fdf <fork>
    1352:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    1355:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1359:	79 19                	jns    1374 <createdelete+0x5c>
      printf(1, "fork failed\n");
    135b:	c7 44 24 04 e5 45 00 	movl   $0x45e5,0x4(%esp)
    1362:	00 
    1363:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    136a:	e8 08 2e 00 00       	call   4177 <printf>
      exit();
    136f:	e8 73 2c 00 00       	call   3fe7 <exit>
    }

    if(pid == 0){
    1374:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1378:	0f 85 bf 00 00 00    	jne    143d <createdelete+0x125>
      name[0] = 'p' + pi;
    137e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1381:	83 c0 70             	add    $0x70,%eax
    1384:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[2] = '\0';
    1387:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
      for(i = 0; i < N; i++){
    138b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1392:	e9 97 00 00 00       	jmp    142e <createdelete+0x116>
        name[1] = '0' + i;
    1397:	8b 45 f4             	mov    -0xc(%ebp),%eax
    139a:	83 c0 30             	add    $0x30,%eax
    139d:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    13a0:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    13a7:	00 
    13a8:	8d 45 c8             	lea    -0x38(%ebp),%eax
    13ab:	89 04 24             	mov    %eax,(%esp)
    13ae:	e8 74 2c 00 00       	call   4027 <open>
    13b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
        if(fd < 0){
    13b6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    13ba:	79 19                	jns    13d5 <createdelete+0xbd>
          printf(1, "create failed\n");
    13bc:	c7 44 24 04 79 4b 00 	movl   $0x4b79,0x4(%esp)
    13c3:	00 
    13c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13cb:	e8 a7 2d 00 00       	call   4177 <printf>
          exit();
    13d0:	e8 12 2c 00 00       	call   3fe7 <exit>
        }
        close(fd);
    13d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13d8:	89 04 24             	mov    %eax,(%esp)
    13db:	e8 2f 2c 00 00       	call   400f <close>
        if(i > 0 && (i % 2 ) == 0){
    13e0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13e4:	7e 44                	jle    142a <createdelete+0x112>
    13e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13e9:	83 e0 01             	and    $0x1,%eax
    13ec:	85 c0                	test   %eax,%eax
    13ee:	75 3a                	jne    142a <createdelete+0x112>
          name[1] = '0' + (i / 2);
    13f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13f3:	89 c2                	mov    %eax,%edx
    13f5:	c1 ea 1f             	shr    $0x1f,%edx
    13f8:	01 d0                	add    %edx,%eax
    13fa:	d1 f8                	sar    %eax
    13fc:	83 c0 30             	add    $0x30,%eax
    13ff:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1402:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1405:	89 04 24             	mov    %eax,(%esp)
    1408:	e8 2a 2c 00 00       	call   4037 <unlink>
    140d:	85 c0                	test   %eax,%eax
    140f:	79 19                	jns    142a <createdelete+0x112>
            printf(1, "unlink failed\n");
    1411:	c7 44 24 04 68 46 00 	movl   $0x4668,0x4(%esp)
    1418:	00 
    1419:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1420:	e8 52 2d 00 00       	call   4177 <printf>
            exit();
    1425:	e8 bd 2b 00 00       	call   3fe7 <exit>
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
    142a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    142e:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1432:	0f 8e 5f ff ff ff    	jle    1397 <createdelete+0x7f>
            printf(1, "unlink failed\n");
            exit();
          }
        }
      }
      exit();
    1438:	e8 aa 2b 00 00       	call   3fe7 <exit>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    143d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1441:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    1445:	0f 8e f3 fe ff ff    	jle    133e <createdelete+0x26>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    144b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1452:	eb 09                	jmp    145d <createdelete+0x145>
    wait();
    1454:	e8 96 2b 00 00       	call   3fef <wait>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    1459:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    145d:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    1461:	7e f1                	jle    1454 <createdelete+0x13c>
    wait();
  }

  name[0] = name[1] = name[2] = 0;
    1463:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1467:	0f b6 45 ca          	movzbl -0x36(%ebp),%eax
    146b:	88 45 c9             	mov    %al,-0x37(%ebp)
    146e:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
    1472:	88 45 c8             	mov    %al,-0x38(%ebp)
  for(i = 0; i < N; i++){
    1475:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    147c:	e9 bb 00 00 00       	jmp    153c <createdelete+0x224>
    for(pi = 0; pi < 4; pi++){
    1481:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1488:	e9 a1 00 00 00       	jmp    152e <createdelete+0x216>
      name[0] = 'p' + pi;
    148d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1490:	83 c0 70             	add    $0x70,%eax
    1493:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1496:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1499:	83 c0 30             	add    $0x30,%eax
    149c:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    149f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14a6:	00 
    14a7:	8d 45 c8             	lea    -0x38(%ebp),%eax
    14aa:	89 04 24             	mov    %eax,(%esp)
    14ad:	e8 75 2b 00 00       	call   4027 <open>
    14b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    14b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14b9:	74 06                	je     14c1 <createdelete+0x1a9>
    14bb:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    14bf:	7e 26                	jle    14e7 <createdelete+0x1cf>
    14c1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    14c5:	79 20                	jns    14e7 <createdelete+0x1cf>
        printf(1, "oops createdelete %s didn't exist\n", name);
    14c7:	8d 45 c8             	lea    -0x38(%ebp),%eax
    14ca:	89 44 24 08          	mov    %eax,0x8(%esp)
    14ce:	c7 44 24 04 d8 4b 00 	movl   $0x4bd8,0x4(%esp)
    14d5:	00 
    14d6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14dd:	e8 95 2c 00 00       	call   4177 <printf>
        exit();
    14e2:	e8 00 2b 00 00       	call   3fe7 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    14e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14eb:	7e 2c                	jle    1519 <createdelete+0x201>
    14ed:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    14f1:	7f 26                	jg     1519 <createdelete+0x201>
    14f3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    14f7:	78 20                	js     1519 <createdelete+0x201>
        printf(1, "oops createdelete %s did exist\n", name);
    14f9:	8d 45 c8             	lea    -0x38(%ebp),%eax
    14fc:	89 44 24 08          	mov    %eax,0x8(%esp)
    1500:	c7 44 24 04 fc 4b 00 	movl   $0x4bfc,0x4(%esp)
    1507:	00 
    1508:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    150f:	e8 63 2c 00 00       	call   4177 <printf>
        exit();
    1514:	e8 ce 2a 00 00       	call   3fe7 <exit>
      }
      if(fd >= 0)
    1519:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    151d:	78 0b                	js     152a <createdelete+0x212>
        close(fd);
    151f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1522:	89 04 24             	mov    %eax,(%esp)
    1525:	e8 e5 2a 00 00       	call   400f <close>
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    152a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    152e:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    1532:	0f 8e 55 ff ff ff    	jle    148d <createdelete+0x175>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1538:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    153c:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1540:	0f 8e 3b ff ff ff    	jle    1481 <createdelete+0x169>
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    1546:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    154d:	eb 34                	jmp    1583 <createdelete+0x26b>
    for(pi = 0; pi < 4; pi++){
    154f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1556:	eb 21                	jmp    1579 <createdelete+0x261>
      name[0] = 'p' + i;
    1558:	8b 45 f4             	mov    -0xc(%ebp),%eax
    155b:	83 c0 70             	add    $0x70,%eax
    155e:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1561:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1564:	83 c0 30             	add    $0x30,%eax
    1567:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    156a:	8d 45 c8             	lea    -0x38(%ebp),%eax
    156d:	89 04 24             	mov    %eax,(%esp)
    1570:	e8 c2 2a 00 00       	call   4037 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1575:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1579:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    157d:	7e d9                	jle    1558 <createdelete+0x240>
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    157f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1583:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1587:	7e c6                	jle    154f <createdelete+0x237>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    1589:	c7 44 24 04 1c 4c 00 	movl   $0x4c1c,0x4(%esp)
    1590:	00 
    1591:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1598:	e8 da 2b 00 00       	call   4177 <printf>
}
    159d:	c9                   	leave  
    159e:	c3                   	ret    

0000159f <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    159f:	55                   	push   %ebp
    15a0:	89 e5                	mov    %esp,%ebp
    15a2:	83 ec 28             	sub    $0x28,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    15a5:	c7 44 24 04 2d 4c 00 	movl   $0x4c2d,0x4(%esp)
    15ac:	00 
    15ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15b4:	e8 be 2b 00 00       	call   4177 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    15b9:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    15c0:	00 
    15c1:	c7 04 24 3e 4c 00 00 	movl   $0x4c3e,(%esp)
    15c8:	e8 5a 2a 00 00       	call   4027 <open>
    15cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    15d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15d4:	79 19                	jns    15ef <unlinkread+0x50>
    printf(1, "create unlinkread failed\n");
    15d6:	c7 44 24 04 49 4c 00 	movl   $0x4c49,0x4(%esp)
    15dd:	00 
    15de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15e5:	e8 8d 2b 00 00       	call   4177 <printf>
    exit();
    15ea:	e8 f8 29 00 00       	call   3fe7 <exit>
  }
  write(fd, "hello", 5);
    15ef:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    15f6:	00 
    15f7:	c7 44 24 04 63 4c 00 	movl   $0x4c63,0x4(%esp)
    15fe:	00 
    15ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1602:	89 04 24             	mov    %eax,(%esp)
    1605:	e8 fd 29 00 00       	call   4007 <write>
  close(fd);
    160a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    160d:	89 04 24             	mov    %eax,(%esp)
    1610:	e8 fa 29 00 00       	call   400f <close>

  fd = open("unlinkread", O_RDWR);
    1615:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    161c:	00 
    161d:	c7 04 24 3e 4c 00 00 	movl   $0x4c3e,(%esp)
    1624:	e8 fe 29 00 00       	call   4027 <open>
    1629:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    162c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1630:	79 19                	jns    164b <unlinkread+0xac>
    printf(1, "open unlinkread failed\n");
    1632:	c7 44 24 04 69 4c 00 	movl   $0x4c69,0x4(%esp)
    1639:	00 
    163a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1641:	e8 31 2b 00 00       	call   4177 <printf>
    exit();
    1646:	e8 9c 29 00 00       	call   3fe7 <exit>
  }
  if(unlink("unlinkread") != 0){
    164b:	c7 04 24 3e 4c 00 00 	movl   $0x4c3e,(%esp)
    1652:	e8 e0 29 00 00       	call   4037 <unlink>
    1657:	85 c0                	test   %eax,%eax
    1659:	74 19                	je     1674 <unlinkread+0xd5>
    printf(1, "unlink unlinkread failed\n");
    165b:	c7 44 24 04 81 4c 00 	movl   $0x4c81,0x4(%esp)
    1662:	00 
    1663:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    166a:	e8 08 2b 00 00       	call   4177 <printf>
    exit();
    166f:	e8 73 29 00 00       	call   3fe7 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1674:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    167b:	00 
    167c:	c7 04 24 3e 4c 00 00 	movl   $0x4c3e,(%esp)
    1683:	e8 9f 29 00 00       	call   4027 <open>
    1688:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    168b:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    1692:	00 
    1693:	c7 44 24 04 9b 4c 00 	movl   $0x4c9b,0x4(%esp)
    169a:	00 
    169b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    169e:	89 04 24             	mov    %eax,(%esp)
    16a1:	e8 61 29 00 00       	call   4007 <write>
  close(fd1);
    16a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16a9:	89 04 24             	mov    %eax,(%esp)
    16ac:	e8 5e 29 00 00       	call   400f <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    16b1:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    16b8:	00 
    16b9:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    16c0:	00 
    16c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16c4:	89 04 24             	mov    %eax,(%esp)
    16c7:	e8 33 29 00 00       	call   3fff <read>
    16cc:	83 f8 05             	cmp    $0x5,%eax
    16cf:	74 19                	je     16ea <unlinkread+0x14b>
    printf(1, "unlinkread read failed");
    16d1:	c7 44 24 04 9f 4c 00 	movl   $0x4c9f,0x4(%esp)
    16d8:	00 
    16d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16e0:	e8 92 2a 00 00       	call   4177 <printf>
    exit();
    16e5:	e8 fd 28 00 00       	call   3fe7 <exit>
  }
  if(buf[0] != 'h'){
    16ea:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    16f1:	3c 68                	cmp    $0x68,%al
    16f3:	74 19                	je     170e <unlinkread+0x16f>
    printf(1, "unlinkread wrong data\n");
    16f5:	c7 44 24 04 b6 4c 00 	movl   $0x4cb6,0x4(%esp)
    16fc:	00 
    16fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1704:	e8 6e 2a 00 00       	call   4177 <printf>
    exit();
    1709:	e8 d9 28 00 00       	call   3fe7 <exit>
  }
  if(write(fd, buf, 10) != 10){
    170e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1715:	00 
    1716:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    171d:	00 
    171e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1721:	89 04 24             	mov    %eax,(%esp)
    1724:	e8 de 28 00 00       	call   4007 <write>
    1729:	83 f8 0a             	cmp    $0xa,%eax
    172c:	74 19                	je     1747 <unlinkread+0x1a8>
    printf(1, "unlinkread write failed\n");
    172e:	c7 44 24 04 cd 4c 00 	movl   $0x4ccd,0x4(%esp)
    1735:	00 
    1736:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    173d:	e8 35 2a 00 00       	call   4177 <printf>
    exit();
    1742:	e8 a0 28 00 00       	call   3fe7 <exit>
  }
  close(fd);
    1747:	8b 45 f4             	mov    -0xc(%ebp),%eax
    174a:	89 04 24             	mov    %eax,(%esp)
    174d:	e8 bd 28 00 00       	call   400f <close>
  unlink("unlinkread");
    1752:	c7 04 24 3e 4c 00 00 	movl   $0x4c3e,(%esp)
    1759:	e8 d9 28 00 00       	call   4037 <unlink>
  printf(1, "unlinkread ok\n");
    175e:	c7 44 24 04 e6 4c 00 	movl   $0x4ce6,0x4(%esp)
    1765:	00 
    1766:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    176d:	e8 05 2a 00 00       	call   4177 <printf>
}
    1772:	c9                   	leave  
    1773:	c3                   	ret    

00001774 <linktest>:

void
linktest(void)
{
    1774:	55                   	push   %ebp
    1775:	89 e5                	mov    %esp,%ebp
    1777:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "linktest\n");
    177a:	c7 44 24 04 f5 4c 00 	movl   $0x4cf5,0x4(%esp)
    1781:	00 
    1782:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1789:	e8 e9 29 00 00       	call   4177 <printf>

  unlink("lf1");
    178e:	c7 04 24 ff 4c 00 00 	movl   $0x4cff,(%esp)
    1795:	e8 9d 28 00 00       	call   4037 <unlink>
  unlink("lf2");
    179a:	c7 04 24 03 4d 00 00 	movl   $0x4d03,(%esp)
    17a1:	e8 91 28 00 00       	call   4037 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    17a6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    17ad:	00 
    17ae:	c7 04 24 ff 4c 00 00 	movl   $0x4cff,(%esp)
    17b5:	e8 6d 28 00 00       	call   4027 <open>
    17ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    17bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    17c1:	79 19                	jns    17dc <linktest+0x68>
    printf(1, "create lf1 failed\n");
    17c3:	c7 44 24 04 07 4d 00 	movl   $0x4d07,0x4(%esp)
    17ca:	00 
    17cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    17d2:	e8 a0 29 00 00       	call   4177 <printf>
    exit();
    17d7:	e8 0b 28 00 00       	call   3fe7 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    17dc:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    17e3:	00 
    17e4:	c7 44 24 04 63 4c 00 	movl   $0x4c63,0x4(%esp)
    17eb:	00 
    17ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ef:	89 04 24             	mov    %eax,(%esp)
    17f2:	e8 10 28 00 00       	call   4007 <write>
    17f7:	83 f8 05             	cmp    $0x5,%eax
    17fa:	74 19                	je     1815 <linktest+0xa1>
    printf(1, "write lf1 failed\n");
    17fc:	c7 44 24 04 1a 4d 00 	movl   $0x4d1a,0x4(%esp)
    1803:	00 
    1804:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    180b:	e8 67 29 00 00       	call   4177 <printf>
    exit();
    1810:	e8 d2 27 00 00       	call   3fe7 <exit>
  }
  close(fd);
    1815:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1818:	89 04 24             	mov    %eax,(%esp)
    181b:	e8 ef 27 00 00       	call   400f <close>

  if(link("lf1", "lf2") < 0){
    1820:	c7 44 24 04 03 4d 00 	movl   $0x4d03,0x4(%esp)
    1827:	00 
    1828:	c7 04 24 ff 4c 00 00 	movl   $0x4cff,(%esp)
    182f:	e8 13 28 00 00       	call   4047 <link>
    1834:	85 c0                	test   %eax,%eax
    1836:	79 19                	jns    1851 <linktest+0xdd>
    printf(1, "link lf1 lf2 failed\n");
    1838:	c7 44 24 04 2c 4d 00 	movl   $0x4d2c,0x4(%esp)
    183f:	00 
    1840:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1847:	e8 2b 29 00 00       	call   4177 <printf>
    exit();
    184c:	e8 96 27 00 00       	call   3fe7 <exit>
  }
  unlink("lf1");
    1851:	c7 04 24 ff 4c 00 00 	movl   $0x4cff,(%esp)
    1858:	e8 da 27 00 00       	call   4037 <unlink>

  if(open("lf1", 0) >= 0){
    185d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1864:	00 
    1865:	c7 04 24 ff 4c 00 00 	movl   $0x4cff,(%esp)
    186c:	e8 b6 27 00 00       	call   4027 <open>
    1871:	85 c0                	test   %eax,%eax
    1873:	78 19                	js     188e <linktest+0x11a>
    printf(1, "unlinked lf1 but it is still there!\n");
    1875:	c7 44 24 04 44 4d 00 	movl   $0x4d44,0x4(%esp)
    187c:	00 
    187d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1884:	e8 ee 28 00 00       	call   4177 <printf>
    exit();
    1889:	e8 59 27 00 00       	call   3fe7 <exit>
  }

  fd = open("lf2", 0);
    188e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1895:	00 
    1896:	c7 04 24 03 4d 00 00 	movl   $0x4d03,(%esp)
    189d:	e8 85 27 00 00       	call   4027 <open>
    18a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    18a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    18a9:	79 19                	jns    18c4 <linktest+0x150>
    printf(1, "open lf2 failed\n");
    18ab:	c7 44 24 04 69 4d 00 	movl   $0x4d69,0x4(%esp)
    18b2:	00 
    18b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18ba:	e8 b8 28 00 00       	call   4177 <printf>
    exit();
    18bf:	e8 23 27 00 00       	call   3fe7 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    18c4:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    18cb:	00 
    18cc:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    18d3:	00 
    18d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18d7:	89 04 24             	mov    %eax,(%esp)
    18da:	e8 20 27 00 00       	call   3fff <read>
    18df:	83 f8 05             	cmp    $0x5,%eax
    18e2:	74 19                	je     18fd <linktest+0x189>
    printf(1, "read lf2 failed\n");
    18e4:	c7 44 24 04 7a 4d 00 	movl   $0x4d7a,0x4(%esp)
    18eb:	00 
    18ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18f3:	e8 7f 28 00 00       	call   4177 <printf>
    exit();
    18f8:	e8 ea 26 00 00       	call   3fe7 <exit>
  }
  close(fd);
    18fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1900:	89 04 24             	mov    %eax,(%esp)
    1903:	e8 07 27 00 00       	call   400f <close>

  if(link("lf2", "lf2") >= 0){
    1908:	c7 44 24 04 03 4d 00 	movl   $0x4d03,0x4(%esp)
    190f:	00 
    1910:	c7 04 24 03 4d 00 00 	movl   $0x4d03,(%esp)
    1917:	e8 2b 27 00 00       	call   4047 <link>
    191c:	85 c0                	test   %eax,%eax
    191e:	78 19                	js     1939 <linktest+0x1c5>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1920:	c7 44 24 04 8b 4d 00 	movl   $0x4d8b,0x4(%esp)
    1927:	00 
    1928:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    192f:	e8 43 28 00 00       	call   4177 <printf>
    exit();
    1934:	e8 ae 26 00 00       	call   3fe7 <exit>
  }

  unlink("lf2");
    1939:	c7 04 24 03 4d 00 00 	movl   $0x4d03,(%esp)
    1940:	e8 f2 26 00 00       	call   4037 <unlink>
  if(link("lf2", "lf1") >= 0){
    1945:	c7 44 24 04 ff 4c 00 	movl   $0x4cff,0x4(%esp)
    194c:	00 
    194d:	c7 04 24 03 4d 00 00 	movl   $0x4d03,(%esp)
    1954:	e8 ee 26 00 00       	call   4047 <link>
    1959:	85 c0                	test   %eax,%eax
    195b:	78 19                	js     1976 <linktest+0x202>
    printf(1, "link non-existant succeeded! oops\n");
    195d:	c7 44 24 04 ac 4d 00 	movl   $0x4dac,0x4(%esp)
    1964:	00 
    1965:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    196c:	e8 06 28 00 00       	call   4177 <printf>
    exit();
    1971:	e8 71 26 00 00       	call   3fe7 <exit>
  }

  if(link(".", "lf1") >= 0){
    1976:	c7 44 24 04 ff 4c 00 	movl   $0x4cff,0x4(%esp)
    197d:	00 
    197e:	c7 04 24 cf 4d 00 00 	movl   $0x4dcf,(%esp)
    1985:	e8 bd 26 00 00       	call   4047 <link>
    198a:	85 c0                	test   %eax,%eax
    198c:	78 19                	js     19a7 <linktest+0x233>
    printf(1, "link . lf1 succeeded! oops\n");
    198e:	c7 44 24 04 d1 4d 00 	movl   $0x4dd1,0x4(%esp)
    1995:	00 
    1996:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    199d:	e8 d5 27 00 00       	call   4177 <printf>
    exit();
    19a2:	e8 40 26 00 00       	call   3fe7 <exit>
  }

  printf(1, "linktest ok\n");
    19a7:	c7 44 24 04 ed 4d 00 	movl   $0x4ded,0x4(%esp)
    19ae:	00 
    19af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19b6:	e8 bc 27 00 00       	call   4177 <printf>
}
    19bb:	c9                   	leave  
    19bc:	c3                   	ret    

000019bd <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    19bd:	55                   	push   %ebp
    19be:	89 e5                	mov    %esp,%ebp
    19c0:	83 ec 68             	sub    $0x68,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    19c3:	c7 44 24 04 fa 4d 00 	movl   $0x4dfa,0x4(%esp)
    19ca:	00 
    19cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19d2:	e8 a0 27 00 00       	call   4177 <printf>
  file[0] = 'C';
    19d7:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    19db:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    19df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    19e6:	e9 06 01 00 00       	jmp    1af1 <concreate+0x134>
    file[1] = '0' + i;
    19eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ee:	83 c0 30             	add    $0x30,%eax
    19f1:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    19f4:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19f7:	89 04 24             	mov    %eax,(%esp)
    19fa:	e8 38 26 00 00       	call   4037 <unlink>
    pid = fork(0,0);
    19ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a06:	00 
    1a07:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a0e:	e8 cc 25 00 00       	call   3fdf <fork>
    1a13:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    1a16:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a1a:	74 3a                	je     1a56 <concreate+0x99>
    1a1c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1a1f:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1a24:	89 c8                	mov    %ecx,%eax
    1a26:	f7 ea                	imul   %edx
    1a28:	89 c8                	mov    %ecx,%eax
    1a2a:	c1 f8 1f             	sar    $0x1f,%eax
    1a2d:	29 c2                	sub    %eax,%edx
    1a2f:	89 d0                	mov    %edx,%eax
    1a31:	01 c0                	add    %eax,%eax
    1a33:	01 d0                	add    %edx,%eax
    1a35:	29 c1                	sub    %eax,%ecx
    1a37:	89 ca                	mov    %ecx,%edx
    1a39:	83 fa 01             	cmp    $0x1,%edx
    1a3c:	75 18                	jne    1a56 <concreate+0x99>
      link("C0", file);
    1a3e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a41:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a45:	c7 04 24 0a 4e 00 00 	movl   $0x4e0a,(%esp)
    1a4c:	e8 f6 25 00 00       	call   4047 <link>
    1a51:	e9 87 00 00 00       	jmp    1add <concreate+0x120>
    } else if(pid == 0 && (i % 5) == 1){
    1a56:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a5a:	75 3a                	jne    1a96 <concreate+0xd9>
    1a5c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1a5f:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1a64:	89 c8                	mov    %ecx,%eax
    1a66:	f7 ea                	imul   %edx
    1a68:	d1 fa                	sar    %edx
    1a6a:	89 c8                	mov    %ecx,%eax
    1a6c:	c1 f8 1f             	sar    $0x1f,%eax
    1a6f:	29 c2                	sub    %eax,%edx
    1a71:	89 d0                	mov    %edx,%eax
    1a73:	c1 e0 02             	shl    $0x2,%eax
    1a76:	01 d0                	add    %edx,%eax
    1a78:	29 c1                	sub    %eax,%ecx
    1a7a:	89 ca                	mov    %ecx,%edx
    1a7c:	83 fa 01             	cmp    $0x1,%edx
    1a7f:	75 15                	jne    1a96 <concreate+0xd9>
      link("C0", file);
    1a81:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a84:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a88:	c7 04 24 0a 4e 00 00 	movl   $0x4e0a,(%esp)
    1a8f:	e8 b3 25 00 00       	call   4047 <link>
    1a94:	eb 47                	jmp    1add <concreate+0x120>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1a96:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1a9d:	00 
    1a9e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1aa1:	89 04 24             	mov    %eax,(%esp)
    1aa4:	e8 7e 25 00 00       	call   4027 <open>
    1aa9:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(fd < 0){
    1aac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1ab0:	79 20                	jns    1ad2 <concreate+0x115>
        printf(1, "concreate create %s failed\n", file);
    1ab2:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1ab5:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ab9:	c7 44 24 04 0d 4e 00 	movl   $0x4e0d,0x4(%esp)
    1ac0:	00 
    1ac1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ac8:	e8 aa 26 00 00       	call   4177 <printf>
        exit();
    1acd:	e8 15 25 00 00       	call   3fe7 <exit>
      }
      close(fd);
    1ad2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ad5:	89 04 24             	mov    %eax,(%esp)
    1ad8:	e8 32 25 00 00       	call   400f <close>
    }
    if(pid == 0)
    1add:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ae1:	75 05                	jne    1ae8 <concreate+0x12b>
      exit();
    1ae3:	e8 ff 24 00 00       	call   3fe7 <exit>
    else
      wait();
    1ae8:	e8 02 25 00 00       	call   3fef <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1aed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1af1:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1af5:	0f 8e f0 fe ff ff    	jle    19eb <concreate+0x2e>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1afb:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    1b02:	00 
    1b03:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b0a:	00 
    1b0b:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1b0e:	89 04 24             	mov    %eax,(%esp)
    1b11:	e8 24 23 00 00       	call   3e3a <memset>
  fd = open(".", 0);
    1b16:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b1d:	00 
    1b1e:	c7 04 24 cf 4d 00 00 	movl   $0x4dcf,(%esp)
    1b25:	e8 fd 24 00 00       	call   4027 <open>
    1b2a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  n = 0;
    1b2d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    1b34:	e9 a1 00 00 00       	jmp    1bda <concreate+0x21d>
    if(de.inum == 0)
    1b39:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    1b3d:	66 85 c0             	test   %ax,%ax
    1b40:	75 05                	jne    1b47 <concreate+0x18a>
      continue;
    1b42:	e9 93 00 00 00       	jmp    1bda <concreate+0x21d>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1b47:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    1b4b:	3c 43                	cmp    $0x43,%al
    1b4d:	0f 85 87 00 00 00    	jne    1bda <concreate+0x21d>
    1b53:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    1b57:	84 c0                	test   %al,%al
    1b59:	75 7f                	jne    1bda <concreate+0x21d>
      i = de.name[1] - '0';
    1b5b:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    1b5f:	0f be c0             	movsbl %al,%eax
    1b62:	83 e8 30             	sub    $0x30,%eax
    1b65:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    1b68:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1b6c:	78 08                	js     1b76 <concreate+0x1b9>
    1b6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b71:	83 f8 27             	cmp    $0x27,%eax
    1b74:	76 23                	jbe    1b99 <concreate+0x1dc>
        printf(1, "concreate weird file %s\n", de.name);
    1b76:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1b79:	83 c0 02             	add    $0x2,%eax
    1b7c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b80:	c7 44 24 04 29 4e 00 	movl   $0x4e29,0x4(%esp)
    1b87:	00 
    1b88:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b8f:	e8 e3 25 00 00       	call   4177 <printf>
        exit();
    1b94:	e8 4e 24 00 00       	call   3fe7 <exit>
      }
      if(fa[i]){
    1b99:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1b9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b9f:	01 d0                	add    %edx,%eax
    1ba1:	0f b6 00             	movzbl (%eax),%eax
    1ba4:	84 c0                	test   %al,%al
    1ba6:	74 23                	je     1bcb <concreate+0x20e>
        printf(1, "concreate duplicate file %s\n", de.name);
    1ba8:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1bab:	83 c0 02             	add    $0x2,%eax
    1bae:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bb2:	c7 44 24 04 42 4e 00 	movl   $0x4e42,0x4(%esp)
    1bb9:	00 
    1bba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bc1:	e8 b1 25 00 00       	call   4177 <printf>
        exit();
    1bc6:	e8 1c 24 00 00       	call   3fe7 <exit>
      }
      fa[i] = 1;
    1bcb:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bd1:	01 d0                	add    %edx,%eax
    1bd3:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    1bd6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1bda:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1be1:	00 
    1be2:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1be5:	89 44 24 04          	mov    %eax,0x4(%esp)
    1be9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1bec:	89 04 24             	mov    %eax,(%esp)
    1bef:	e8 0b 24 00 00       	call   3fff <read>
    1bf4:	85 c0                	test   %eax,%eax
    1bf6:	0f 8f 3d ff ff ff    	jg     1b39 <concreate+0x17c>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    1bfc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1bff:	89 04 24             	mov    %eax,(%esp)
    1c02:	e8 08 24 00 00       	call   400f <close>

  if(n != 40){
    1c07:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    1c0b:	74 19                	je     1c26 <concreate+0x269>
    printf(1, "concreate not enough files in directory listing\n");
    1c0d:	c7 44 24 04 60 4e 00 	movl   $0x4e60,0x4(%esp)
    1c14:	00 
    1c15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c1c:	e8 56 25 00 00       	call   4177 <printf>
    exit();
    1c21:	e8 c1 23 00 00       	call   3fe7 <exit>
  }

  for(i = 0; i < 40; i++){
    1c26:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c2d:	e9 3c 01 00 00       	jmp    1d6e <concreate+0x3b1>
    file[1] = '0' + i;
    1c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c35:	83 c0 30             	add    $0x30,%eax
    1c38:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork(0,0);
    1c3b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1c42:	00 
    1c43:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c4a:	e8 90 23 00 00       	call   3fdf <fork>
    1c4f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    1c52:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c56:	79 19                	jns    1c71 <concreate+0x2b4>
      printf(1, "fork failed\n");
    1c58:	c7 44 24 04 e5 45 00 	movl   $0x45e5,0x4(%esp)
    1c5f:	00 
    1c60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c67:	e8 0b 25 00 00       	call   4177 <printf>
      exit();
    1c6c:	e8 76 23 00 00       	call   3fe7 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    1c71:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1c74:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1c79:	89 c8                	mov    %ecx,%eax
    1c7b:	f7 ea                	imul   %edx
    1c7d:	89 c8                	mov    %ecx,%eax
    1c7f:	c1 f8 1f             	sar    $0x1f,%eax
    1c82:	29 c2                	sub    %eax,%edx
    1c84:	89 d0                	mov    %edx,%eax
    1c86:	01 c0                	add    %eax,%eax
    1c88:	01 d0                	add    %edx,%eax
    1c8a:	29 c1                	sub    %eax,%ecx
    1c8c:	89 ca                	mov    %ecx,%edx
    1c8e:	85 d2                	test   %edx,%edx
    1c90:	75 06                	jne    1c98 <concreate+0x2db>
    1c92:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c96:	74 28                	je     1cc0 <concreate+0x303>
       ((i % 3) == 1 && pid != 0)){
    1c98:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1c9b:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1ca0:	89 c8                	mov    %ecx,%eax
    1ca2:	f7 ea                	imul   %edx
    1ca4:	89 c8                	mov    %ecx,%eax
    1ca6:	c1 f8 1f             	sar    $0x1f,%eax
    1ca9:	29 c2                	sub    %eax,%edx
    1cab:	89 d0                	mov    %edx,%eax
    1cad:	01 c0                	add    %eax,%eax
    1caf:	01 d0                	add    %edx,%eax
    1cb1:	29 c1                	sub    %eax,%ecx
    1cb3:	89 ca                	mov    %ecx,%edx
    pid = fork(0,0);
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1cb5:	83 fa 01             	cmp    $0x1,%edx
    1cb8:	75 74                	jne    1d2e <concreate+0x371>
       ((i % 3) == 1 && pid != 0)){
    1cba:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1cbe:	74 6e                	je     1d2e <concreate+0x371>
      close(open(file, 0));
    1cc0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1cc7:	00 
    1cc8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1ccb:	89 04 24             	mov    %eax,(%esp)
    1cce:	e8 54 23 00 00       	call   4027 <open>
    1cd3:	89 04 24             	mov    %eax,(%esp)
    1cd6:	e8 34 23 00 00       	call   400f <close>
      close(open(file, 0));
    1cdb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1ce2:	00 
    1ce3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1ce6:	89 04 24             	mov    %eax,(%esp)
    1ce9:	e8 39 23 00 00       	call   4027 <open>
    1cee:	89 04 24             	mov    %eax,(%esp)
    1cf1:	e8 19 23 00 00       	call   400f <close>
      close(open(file, 0));
    1cf6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1cfd:	00 
    1cfe:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1d01:	89 04 24             	mov    %eax,(%esp)
    1d04:	e8 1e 23 00 00       	call   4027 <open>
    1d09:	89 04 24             	mov    %eax,(%esp)
    1d0c:	e8 fe 22 00 00       	call   400f <close>
      close(open(file, 0));
    1d11:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1d18:	00 
    1d19:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1d1c:	89 04 24             	mov    %eax,(%esp)
    1d1f:	e8 03 23 00 00       	call   4027 <open>
    1d24:	89 04 24             	mov    %eax,(%esp)
    1d27:	e8 e3 22 00 00       	call   400f <close>
    1d2c:	eb 2c                	jmp    1d5a <concreate+0x39d>
    } else {
      unlink(file);
    1d2e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1d31:	89 04 24             	mov    %eax,(%esp)
    1d34:	e8 fe 22 00 00       	call   4037 <unlink>
      unlink(file);
    1d39:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1d3c:	89 04 24             	mov    %eax,(%esp)
    1d3f:	e8 f3 22 00 00       	call   4037 <unlink>
      unlink(file);
    1d44:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1d47:	89 04 24             	mov    %eax,(%esp)
    1d4a:	e8 e8 22 00 00       	call   4037 <unlink>
      unlink(file);
    1d4f:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1d52:	89 04 24             	mov    %eax,(%esp)
    1d55:	e8 dd 22 00 00       	call   4037 <unlink>
    }
    if(pid == 0)
    1d5a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d5e:	75 05                	jne    1d65 <concreate+0x3a8>
      exit();
    1d60:	e8 82 22 00 00       	call   3fe7 <exit>
    else
      wait();
    1d65:	e8 85 22 00 00       	call   3fef <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1d6a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d6e:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1d72:	0f 8e ba fe ff ff    	jle    1c32 <concreate+0x275>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1d78:	c7 44 24 04 91 4e 00 	movl   $0x4e91,0x4(%esp)
    1d7f:	00 
    1d80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d87:	e8 eb 23 00 00       	call   4177 <printf>
}
    1d8c:	c9                   	leave  
    1d8d:	c3                   	ret    

00001d8e <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1d8e:	55                   	push   %ebp
    1d8f:	89 e5                	mov    %esp,%ebp
    1d91:	83 ec 28             	sub    $0x28,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1d94:	c7 44 24 04 9f 4e 00 	movl   $0x4e9f,0x4(%esp)
    1d9b:	00 
    1d9c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1da3:	e8 cf 23 00 00       	call   4177 <printf>

  unlink("x");
    1da8:	c7 04 24 1b 4a 00 00 	movl   $0x4a1b,(%esp)
    1daf:	e8 83 22 00 00       	call   4037 <unlink>
  pid = fork(0,0);
    1db4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1dbb:	00 
    1dbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1dc3:	e8 17 22 00 00       	call   3fdf <fork>
    1dc8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1dcb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1dcf:	79 19                	jns    1dea <linkunlink+0x5c>
    printf(1, "fork failed\n");
    1dd1:	c7 44 24 04 e5 45 00 	movl   $0x45e5,0x4(%esp)
    1dd8:	00 
    1dd9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1de0:	e8 92 23 00 00       	call   4177 <printf>
    exit();
    1de5:	e8 fd 21 00 00       	call   3fe7 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1dea:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1dee:	74 07                	je     1df7 <linkunlink+0x69>
    1df0:	b8 01 00 00 00       	mov    $0x1,%eax
    1df5:	eb 05                	jmp    1dfc <linkunlink+0x6e>
    1df7:	b8 61 00 00 00       	mov    $0x61,%eax
    1dfc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1dff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1e06:	e9 8e 00 00 00       	jmp    1e99 <linkunlink+0x10b>
    x = x * 1103515245 + 12345;
    1e0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e0e:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1e14:	05 39 30 00 00       	add    $0x3039,%eax
    1e19:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1e1c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1e1f:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1e24:	89 c8                	mov    %ecx,%eax
    1e26:	f7 e2                	mul    %edx
    1e28:	d1 ea                	shr    %edx
    1e2a:	89 d0                	mov    %edx,%eax
    1e2c:	01 c0                	add    %eax,%eax
    1e2e:	01 d0                	add    %edx,%eax
    1e30:	29 c1                	sub    %eax,%ecx
    1e32:	89 ca                	mov    %ecx,%edx
    1e34:	85 d2                	test   %edx,%edx
    1e36:	75 1e                	jne    1e56 <linkunlink+0xc8>
      close(open("x", O_RDWR | O_CREATE));
    1e38:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1e3f:	00 
    1e40:	c7 04 24 1b 4a 00 00 	movl   $0x4a1b,(%esp)
    1e47:	e8 db 21 00 00       	call   4027 <open>
    1e4c:	89 04 24             	mov    %eax,(%esp)
    1e4f:	e8 bb 21 00 00       	call   400f <close>
    1e54:	eb 3f                	jmp    1e95 <linkunlink+0x107>
    } else if((x % 3) == 1){
    1e56:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1e59:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1e5e:	89 c8                	mov    %ecx,%eax
    1e60:	f7 e2                	mul    %edx
    1e62:	d1 ea                	shr    %edx
    1e64:	89 d0                	mov    %edx,%eax
    1e66:	01 c0                	add    %eax,%eax
    1e68:	01 d0                	add    %edx,%eax
    1e6a:	29 c1                	sub    %eax,%ecx
    1e6c:	89 ca                	mov    %ecx,%edx
    1e6e:	83 fa 01             	cmp    $0x1,%edx
    1e71:	75 16                	jne    1e89 <linkunlink+0xfb>
      link("cat", "x");
    1e73:	c7 44 24 04 1b 4a 00 	movl   $0x4a1b,0x4(%esp)
    1e7a:	00 
    1e7b:	c7 04 24 b0 4e 00 00 	movl   $0x4eb0,(%esp)
    1e82:	e8 c0 21 00 00       	call   4047 <link>
    1e87:	eb 0c                	jmp    1e95 <linkunlink+0x107>
    } else {
      unlink("x");
    1e89:	c7 04 24 1b 4a 00 00 	movl   $0x4a1b,(%esp)
    1e90:	e8 a2 21 00 00       	call   4037 <unlink>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1e95:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1e99:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1e9d:	0f 8e 68 ff ff ff    	jle    1e0b <linkunlink+0x7d>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1ea3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ea7:	74 07                	je     1eb0 <linkunlink+0x122>
    wait();
    1ea9:	e8 41 21 00 00       	call   3fef <wait>
    1eae:	eb 05                	jmp    1eb5 <linkunlink+0x127>
  else 
    exit();
    1eb0:	e8 32 21 00 00       	call   3fe7 <exit>

  printf(1, "linkunlink ok\n");
    1eb5:	c7 44 24 04 b4 4e 00 	movl   $0x4eb4,0x4(%esp)
    1ebc:	00 
    1ebd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ec4:	e8 ae 22 00 00       	call   4177 <printf>
}
    1ec9:	c9                   	leave  
    1eca:	c3                   	ret    

00001ecb <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    1ecb:	55                   	push   %ebp
    1ecc:	89 e5                	mov    %esp,%ebp
    1ece:	83 ec 38             	sub    $0x38,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1ed1:	c7 44 24 04 c3 4e 00 	movl   $0x4ec3,0x4(%esp)
    1ed8:	00 
    1ed9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ee0:	e8 92 22 00 00       	call   4177 <printf>
  unlink("bd");
    1ee5:	c7 04 24 d0 4e 00 00 	movl   $0x4ed0,(%esp)
    1eec:	e8 46 21 00 00       	call   4037 <unlink>

  fd = open("bd", O_CREATE);
    1ef1:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1ef8:	00 
    1ef9:	c7 04 24 d0 4e 00 00 	movl   $0x4ed0,(%esp)
    1f00:	e8 22 21 00 00       	call   4027 <open>
    1f05:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1f08:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1f0c:	79 19                	jns    1f27 <bigdir+0x5c>
    printf(1, "bigdir create failed\n");
    1f0e:	c7 44 24 04 d3 4e 00 	movl   $0x4ed3,0x4(%esp)
    1f15:	00 
    1f16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f1d:	e8 55 22 00 00       	call   4177 <printf>
    exit();
    1f22:	e8 c0 20 00 00       	call   3fe7 <exit>
  }
  close(fd);
    1f27:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f2a:	89 04 24             	mov    %eax,(%esp)
    1f2d:	e8 dd 20 00 00       	call   400f <close>

  for(i = 0; i < 500; i++){
    1f32:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f39:	eb 64                	jmp    1f9f <bigdir+0xd4>
    name[0] = 'x';
    1f3b:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f42:	8d 50 3f             	lea    0x3f(%eax),%edx
    1f45:	85 c0                	test   %eax,%eax
    1f47:	0f 48 c2             	cmovs  %edx,%eax
    1f4a:	c1 f8 06             	sar    $0x6,%eax
    1f4d:	83 c0 30             	add    $0x30,%eax
    1f50:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1f53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f56:	99                   	cltd   
    1f57:	c1 ea 1a             	shr    $0x1a,%edx
    1f5a:	01 d0                	add    %edx,%eax
    1f5c:	83 e0 3f             	and    $0x3f,%eax
    1f5f:	29 d0                	sub    %edx,%eax
    1f61:	83 c0 30             	add    $0x30,%eax
    1f64:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1f67:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1f6b:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1f6e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f72:	c7 04 24 d0 4e 00 00 	movl   $0x4ed0,(%esp)
    1f79:	e8 c9 20 00 00       	call   4047 <link>
    1f7e:	85 c0                	test   %eax,%eax
    1f80:	74 19                	je     1f9b <bigdir+0xd0>
      printf(1, "bigdir link failed\n");
    1f82:	c7 44 24 04 e9 4e 00 	movl   $0x4ee9,0x4(%esp)
    1f89:	00 
    1f8a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f91:	e8 e1 21 00 00       	call   4177 <printf>
      exit();
    1f96:	e8 4c 20 00 00       	call   3fe7 <exit>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1f9b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f9f:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1fa6:	7e 93                	jle    1f3b <bigdir+0x70>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1fa8:	c7 04 24 d0 4e 00 00 	movl   $0x4ed0,(%esp)
    1faf:	e8 83 20 00 00       	call   4037 <unlink>
  for(i = 0; i < 500; i++){
    1fb4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1fbb:	eb 5c                	jmp    2019 <bigdir+0x14e>
    name[0] = 'x';
    1fbd:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1fc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fc4:	8d 50 3f             	lea    0x3f(%eax),%edx
    1fc7:	85 c0                	test   %eax,%eax
    1fc9:	0f 48 c2             	cmovs  %edx,%eax
    1fcc:	c1 f8 06             	sar    $0x6,%eax
    1fcf:	83 c0 30             	add    $0x30,%eax
    1fd2:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1fd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fd8:	99                   	cltd   
    1fd9:	c1 ea 1a             	shr    $0x1a,%edx
    1fdc:	01 d0                	add    %edx,%eax
    1fde:	83 e0 3f             	and    $0x3f,%eax
    1fe1:	29 d0                	sub    %edx,%eax
    1fe3:	83 c0 30             	add    $0x30,%eax
    1fe6:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1fe9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1fed:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1ff0:	89 04 24             	mov    %eax,(%esp)
    1ff3:	e8 3f 20 00 00       	call   4037 <unlink>
    1ff8:	85 c0                	test   %eax,%eax
    1ffa:	74 19                	je     2015 <bigdir+0x14a>
      printf(1, "bigdir unlink failed");
    1ffc:	c7 44 24 04 fd 4e 00 	movl   $0x4efd,0x4(%esp)
    2003:	00 
    2004:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    200b:	e8 67 21 00 00       	call   4177 <printf>
      exit();
    2010:	e8 d2 1f 00 00       	call   3fe7 <exit>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    2015:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2019:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    2020:	7e 9b                	jle    1fbd <bigdir+0xf2>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    2022:	c7 44 24 04 12 4f 00 	movl   $0x4f12,0x4(%esp)
    2029:	00 
    202a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2031:	e8 41 21 00 00       	call   4177 <printf>
}
    2036:	c9                   	leave  
    2037:	c3                   	ret    

00002038 <subdir>:

void
subdir(void)
{
    2038:	55                   	push   %ebp
    2039:	89 e5                	mov    %esp,%ebp
    203b:	83 ec 28             	sub    $0x28,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    203e:	c7 44 24 04 1d 4f 00 	movl   $0x4f1d,0x4(%esp)
    2045:	00 
    2046:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    204d:	e8 25 21 00 00       	call   4177 <printf>

  unlink("ff");
    2052:	c7 04 24 2a 4f 00 00 	movl   $0x4f2a,(%esp)
    2059:	e8 d9 1f 00 00       	call   4037 <unlink>
  if(mkdir("dd") != 0){
    205e:	c7 04 24 2d 4f 00 00 	movl   $0x4f2d,(%esp)
    2065:	e8 e5 1f 00 00       	call   404f <mkdir>
    206a:	85 c0                	test   %eax,%eax
    206c:	74 19                	je     2087 <subdir+0x4f>
    printf(1, "subdir mkdir dd failed\n");
    206e:	c7 44 24 04 30 4f 00 	movl   $0x4f30,0x4(%esp)
    2075:	00 
    2076:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    207d:	e8 f5 20 00 00       	call   4177 <printf>
    exit();
    2082:	e8 60 1f 00 00       	call   3fe7 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    2087:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    208e:	00 
    208f:	c7 04 24 48 4f 00 00 	movl   $0x4f48,(%esp)
    2096:	e8 8c 1f 00 00       	call   4027 <open>
    209b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    209e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    20a2:	79 19                	jns    20bd <subdir+0x85>
    printf(1, "create dd/ff failed\n");
    20a4:	c7 44 24 04 4e 4f 00 	movl   $0x4f4e,0x4(%esp)
    20ab:	00 
    20ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20b3:	e8 bf 20 00 00       	call   4177 <printf>
    exit();
    20b8:	e8 2a 1f 00 00       	call   3fe7 <exit>
  }
  write(fd, "ff", 2);
    20bd:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    20c4:	00 
    20c5:	c7 44 24 04 2a 4f 00 	movl   $0x4f2a,0x4(%esp)
    20cc:	00 
    20cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20d0:	89 04 24             	mov    %eax,(%esp)
    20d3:	e8 2f 1f 00 00       	call   4007 <write>
  close(fd);
    20d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20db:	89 04 24             	mov    %eax,(%esp)
    20de:	e8 2c 1f 00 00       	call   400f <close>
  
  if(unlink("dd") >= 0){
    20e3:	c7 04 24 2d 4f 00 00 	movl   $0x4f2d,(%esp)
    20ea:	e8 48 1f 00 00       	call   4037 <unlink>
    20ef:	85 c0                	test   %eax,%eax
    20f1:	78 19                	js     210c <subdir+0xd4>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    20f3:	c7 44 24 04 64 4f 00 	movl   $0x4f64,0x4(%esp)
    20fa:	00 
    20fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2102:	e8 70 20 00 00       	call   4177 <printf>
    exit();
    2107:	e8 db 1e 00 00       	call   3fe7 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    210c:	c7 04 24 8a 4f 00 00 	movl   $0x4f8a,(%esp)
    2113:	e8 37 1f 00 00       	call   404f <mkdir>
    2118:	85 c0                	test   %eax,%eax
    211a:	74 19                	je     2135 <subdir+0xfd>
    printf(1, "subdir mkdir dd/dd failed\n");
    211c:	c7 44 24 04 91 4f 00 	movl   $0x4f91,0x4(%esp)
    2123:	00 
    2124:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    212b:	e8 47 20 00 00       	call   4177 <printf>
    exit();
    2130:	e8 b2 1e 00 00       	call   3fe7 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2135:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    213c:	00 
    213d:	c7 04 24 ac 4f 00 00 	movl   $0x4fac,(%esp)
    2144:	e8 de 1e 00 00       	call   4027 <open>
    2149:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    214c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2150:	79 19                	jns    216b <subdir+0x133>
    printf(1, "create dd/dd/ff failed\n");
    2152:	c7 44 24 04 b5 4f 00 	movl   $0x4fb5,0x4(%esp)
    2159:	00 
    215a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2161:	e8 11 20 00 00       	call   4177 <printf>
    exit();
    2166:	e8 7c 1e 00 00       	call   3fe7 <exit>
  }
  write(fd, "FF", 2);
    216b:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    2172:	00 
    2173:	c7 44 24 04 cd 4f 00 	movl   $0x4fcd,0x4(%esp)
    217a:	00 
    217b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    217e:	89 04 24             	mov    %eax,(%esp)
    2181:	e8 81 1e 00 00       	call   4007 <write>
  close(fd);
    2186:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2189:	89 04 24             	mov    %eax,(%esp)
    218c:	e8 7e 1e 00 00       	call   400f <close>

  fd = open("dd/dd/../ff", 0);
    2191:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2198:	00 
    2199:	c7 04 24 d0 4f 00 00 	movl   $0x4fd0,(%esp)
    21a0:	e8 82 1e 00 00       	call   4027 <open>
    21a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    21a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    21ac:	79 19                	jns    21c7 <subdir+0x18f>
    printf(1, "open dd/dd/../ff failed\n");
    21ae:	c7 44 24 04 dc 4f 00 	movl   $0x4fdc,0x4(%esp)
    21b5:	00 
    21b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21bd:	e8 b5 1f 00 00       	call   4177 <printf>
    exit();
    21c2:	e8 20 1e 00 00       	call   3fe7 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    21c7:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    21ce:	00 
    21cf:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    21d6:	00 
    21d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21da:	89 04 24             	mov    %eax,(%esp)
    21dd:	e8 1d 1e 00 00       	call   3fff <read>
    21e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    21e5:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    21e9:	75 0b                	jne    21f6 <subdir+0x1be>
    21eb:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    21f2:	3c 66                	cmp    $0x66,%al
    21f4:	74 19                	je     220f <subdir+0x1d7>
    printf(1, "dd/dd/../ff wrong content\n");
    21f6:	c7 44 24 04 f5 4f 00 	movl   $0x4ff5,0x4(%esp)
    21fd:	00 
    21fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2205:	e8 6d 1f 00 00       	call   4177 <printf>
    exit();
    220a:	e8 d8 1d 00 00       	call   3fe7 <exit>
  }
  close(fd);
    220f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2212:	89 04 24             	mov    %eax,(%esp)
    2215:	e8 f5 1d 00 00       	call   400f <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    221a:	c7 44 24 04 10 50 00 	movl   $0x5010,0x4(%esp)
    2221:	00 
    2222:	c7 04 24 ac 4f 00 00 	movl   $0x4fac,(%esp)
    2229:	e8 19 1e 00 00       	call   4047 <link>
    222e:	85 c0                	test   %eax,%eax
    2230:	74 19                	je     224b <subdir+0x213>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2232:	c7 44 24 04 1c 50 00 	movl   $0x501c,0x4(%esp)
    2239:	00 
    223a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2241:	e8 31 1f 00 00       	call   4177 <printf>
    exit();
    2246:	e8 9c 1d 00 00       	call   3fe7 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    224b:	c7 04 24 ac 4f 00 00 	movl   $0x4fac,(%esp)
    2252:	e8 e0 1d 00 00       	call   4037 <unlink>
    2257:	85 c0                	test   %eax,%eax
    2259:	74 19                	je     2274 <subdir+0x23c>
    printf(1, "unlink dd/dd/ff failed\n");
    225b:	c7 44 24 04 3d 50 00 	movl   $0x503d,0x4(%esp)
    2262:	00 
    2263:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    226a:	e8 08 1f 00 00       	call   4177 <printf>
    exit();
    226f:	e8 73 1d 00 00       	call   3fe7 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2274:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    227b:	00 
    227c:	c7 04 24 ac 4f 00 00 	movl   $0x4fac,(%esp)
    2283:	e8 9f 1d 00 00       	call   4027 <open>
    2288:	85 c0                	test   %eax,%eax
    228a:	78 19                	js     22a5 <subdir+0x26d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    228c:	c7 44 24 04 58 50 00 	movl   $0x5058,0x4(%esp)
    2293:	00 
    2294:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    229b:	e8 d7 1e 00 00       	call   4177 <printf>
    exit();
    22a0:	e8 42 1d 00 00       	call   3fe7 <exit>
  }

  if(chdir("dd") != 0){
    22a5:	c7 04 24 2d 4f 00 00 	movl   $0x4f2d,(%esp)
    22ac:	e8 a6 1d 00 00       	call   4057 <chdir>
    22b1:	85 c0                	test   %eax,%eax
    22b3:	74 19                	je     22ce <subdir+0x296>
    printf(1, "chdir dd failed\n");
    22b5:	c7 44 24 04 7c 50 00 	movl   $0x507c,0x4(%esp)
    22bc:	00 
    22bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22c4:	e8 ae 1e 00 00       	call   4177 <printf>
    exit();
    22c9:	e8 19 1d 00 00       	call   3fe7 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    22ce:	c7 04 24 8d 50 00 00 	movl   $0x508d,(%esp)
    22d5:	e8 7d 1d 00 00       	call   4057 <chdir>
    22da:	85 c0                	test   %eax,%eax
    22dc:	74 19                	je     22f7 <subdir+0x2bf>
    printf(1, "chdir dd/../../dd failed\n");
    22de:	c7 44 24 04 99 50 00 	movl   $0x5099,0x4(%esp)
    22e5:	00 
    22e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22ed:	e8 85 1e 00 00       	call   4177 <printf>
    exit();
    22f2:	e8 f0 1c 00 00       	call   3fe7 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    22f7:	c7 04 24 b3 50 00 00 	movl   $0x50b3,(%esp)
    22fe:	e8 54 1d 00 00       	call   4057 <chdir>
    2303:	85 c0                	test   %eax,%eax
    2305:	74 19                	je     2320 <subdir+0x2e8>
    printf(1, "chdir dd/../../dd failed\n");
    2307:	c7 44 24 04 99 50 00 	movl   $0x5099,0x4(%esp)
    230e:	00 
    230f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2316:	e8 5c 1e 00 00       	call   4177 <printf>
    exit();
    231b:	e8 c7 1c 00 00       	call   3fe7 <exit>
  }
  if(chdir("./..") != 0){
    2320:	c7 04 24 c2 50 00 00 	movl   $0x50c2,(%esp)
    2327:	e8 2b 1d 00 00       	call   4057 <chdir>
    232c:	85 c0                	test   %eax,%eax
    232e:	74 19                	je     2349 <subdir+0x311>
    printf(1, "chdir ./.. failed\n");
    2330:	c7 44 24 04 c7 50 00 	movl   $0x50c7,0x4(%esp)
    2337:	00 
    2338:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    233f:	e8 33 1e 00 00       	call   4177 <printf>
    exit();
    2344:	e8 9e 1c 00 00       	call   3fe7 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    2349:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2350:	00 
    2351:	c7 04 24 10 50 00 00 	movl   $0x5010,(%esp)
    2358:	e8 ca 1c 00 00       	call   4027 <open>
    235d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2360:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2364:	79 19                	jns    237f <subdir+0x347>
    printf(1, "open dd/dd/ffff failed\n");
    2366:	c7 44 24 04 da 50 00 	movl   $0x50da,0x4(%esp)
    236d:	00 
    236e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2375:	e8 fd 1d 00 00       	call   4177 <printf>
    exit();
    237a:	e8 68 1c 00 00       	call   3fe7 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    237f:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    2386:	00 
    2387:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    238e:	00 
    238f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2392:	89 04 24             	mov    %eax,(%esp)
    2395:	e8 65 1c 00 00       	call   3fff <read>
    239a:	83 f8 02             	cmp    $0x2,%eax
    239d:	74 19                	je     23b8 <subdir+0x380>
    printf(1, "read dd/dd/ffff wrong len\n");
    239f:	c7 44 24 04 f2 50 00 	movl   $0x50f2,0x4(%esp)
    23a6:	00 
    23a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23ae:	e8 c4 1d 00 00       	call   4177 <printf>
    exit();
    23b3:	e8 2f 1c 00 00       	call   3fe7 <exit>
  }
  close(fd);
    23b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23bb:	89 04 24             	mov    %eax,(%esp)
    23be:	e8 4c 1c 00 00       	call   400f <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    23c3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    23ca:	00 
    23cb:	c7 04 24 ac 4f 00 00 	movl   $0x4fac,(%esp)
    23d2:	e8 50 1c 00 00       	call   4027 <open>
    23d7:	85 c0                	test   %eax,%eax
    23d9:	78 19                	js     23f4 <subdir+0x3bc>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    23db:	c7 44 24 04 10 51 00 	movl   $0x5110,0x4(%esp)
    23e2:	00 
    23e3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23ea:	e8 88 1d 00 00       	call   4177 <printf>
    exit();
    23ef:	e8 f3 1b 00 00       	call   3fe7 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    23f4:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    23fb:	00 
    23fc:	c7 04 24 35 51 00 00 	movl   $0x5135,(%esp)
    2403:	e8 1f 1c 00 00       	call   4027 <open>
    2408:	85 c0                	test   %eax,%eax
    240a:	78 19                	js     2425 <subdir+0x3ed>
    printf(1, "create dd/ff/ff succeeded!\n");
    240c:	c7 44 24 04 3e 51 00 	movl   $0x513e,0x4(%esp)
    2413:	00 
    2414:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    241b:	e8 57 1d 00 00       	call   4177 <printf>
    exit();
    2420:	e8 c2 1b 00 00       	call   3fe7 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2425:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    242c:	00 
    242d:	c7 04 24 5a 51 00 00 	movl   $0x515a,(%esp)
    2434:	e8 ee 1b 00 00       	call   4027 <open>
    2439:	85 c0                	test   %eax,%eax
    243b:	78 19                	js     2456 <subdir+0x41e>
    printf(1, "create dd/xx/ff succeeded!\n");
    243d:	c7 44 24 04 63 51 00 	movl   $0x5163,0x4(%esp)
    2444:	00 
    2445:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    244c:	e8 26 1d 00 00       	call   4177 <printf>
    exit();
    2451:	e8 91 1b 00 00       	call   3fe7 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    2456:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    245d:	00 
    245e:	c7 04 24 2d 4f 00 00 	movl   $0x4f2d,(%esp)
    2465:	e8 bd 1b 00 00       	call   4027 <open>
    246a:	85 c0                	test   %eax,%eax
    246c:	78 19                	js     2487 <subdir+0x44f>
    printf(1, "create dd succeeded!\n");
    246e:	c7 44 24 04 7f 51 00 	movl   $0x517f,0x4(%esp)
    2475:	00 
    2476:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    247d:	e8 f5 1c 00 00       	call   4177 <printf>
    exit();
    2482:	e8 60 1b 00 00       	call   3fe7 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    2487:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    248e:	00 
    248f:	c7 04 24 2d 4f 00 00 	movl   $0x4f2d,(%esp)
    2496:	e8 8c 1b 00 00       	call   4027 <open>
    249b:	85 c0                	test   %eax,%eax
    249d:	78 19                	js     24b8 <subdir+0x480>
    printf(1, "open dd rdwr succeeded!\n");
    249f:	c7 44 24 04 95 51 00 	movl   $0x5195,0x4(%esp)
    24a6:	00 
    24a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24ae:	e8 c4 1c 00 00       	call   4177 <printf>
    exit();
    24b3:	e8 2f 1b 00 00       	call   3fe7 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    24b8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    24bf:	00 
    24c0:	c7 04 24 2d 4f 00 00 	movl   $0x4f2d,(%esp)
    24c7:	e8 5b 1b 00 00       	call   4027 <open>
    24cc:	85 c0                	test   %eax,%eax
    24ce:	78 19                	js     24e9 <subdir+0x4b1>
    printf(1, "open dd wronly succeeded!\n");
    24d0:	c7 44 24 04 ae 51 00 	movl   $0x51ae,0x4(%esp)
    24d7:	00 
    24d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24df:	e8 93 1c 00 00       	call   4177 <printf>
    exit();
    24e4:	e8 fe 1a 00 00       	call   3fe7 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    24e9:	c7 44 24 04 c9 51 00 	movl   $0x51c9,0x4(%esp)
    24f0:	00 
    24f1:	c7 04 24 35 51 00 00 	movl   $0x5135,(%esp)
    24f8:	e8 4a 1b 00 00       	call   4047 <link>
    24fd:	85 c0                	test   %eax,%eax
    24ff:	75 19                	jne    251a <subdir+0x4e2>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2501:	c7 44 24 04 d4 51 00 	movl   $0x51d4,0x4(%esp)
    2508:	00 
    2509:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2510:	e8 62 1c 00 00       	call   4177 <printf>
    exit();
    2515:	e8 cd 1a 00 00       	call   3fe7 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    251a:	c7 44 24 04 c9 51 00 	movl   $0x51c9,0x4(%esp)
    2521:	00 
    2522:	c7 04 24 5a 51 00 00 	movl   $0x515a,(%esp)
    2529:	e8 19 1b 00 00       	call   4047 <link>
    252e:	85 c0                	test   %eax,%eax
    2530:	75 19                	jne    254b <subdir+0x513>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2532:	c7 44 24 04 f8 51 00 	movl   $0x51f8,0x4(%esp)
    2539:	00 
    253a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2541:	e8 31 1c 00 00       	call   4177 <printf>
    exit();
    2546:	e8 9c 1a 00 00       	call   3fe7 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    254b:	c7 44 24 04 10 50 00 	movl   $0x5010,0x4(%esp)
    2552:	00 
    2553:	c7 04 24 48 4f 00 00 	movl   $0x4f48,(%esp)
    255a:	e8 e8 1a 00 00       	call   4047 <link>
    255f:	85 c0                	test   %eax,%eax
    2561:	75 19                	jne    257c <subdir+0x544>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2563:	c7 44 24 04 1c 52 00 	movl   $0x521c,0x4(%esp)
    256a:	00 
    256b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2572:	e8 00 1c 00 00       	call   4177 <printf>
    exit();
    2577:	e8 6b 1a 00 00       	call   3fe7 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    257c:	c7 04 24 35 51 00 00 	movl   $0x5135,(%esp)
    2583:	e8 c7 1a 00 00       	call   404f <mkdir>
    2588:	85 c0                	test   %eax,%eax
    258a:	75 19                	jne    25a5 <subdir+0x56d>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    258c:	c7 44 24 04 3e 52 00 	movl   $0x523e,0x4(%esp)
    2593:	00 
    2594:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    259b:	e8 d7 1b 00 00       	call   4177 <printf>
    exit();
    25a0:	e8 42 1a 00 00       	call   3fe7 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    25a5:	c7 04 24 5a 51 00 00 	movl   $0x515a,(%esp)
    25ac:	e8 9e 1a 00 00       	call   404f <mkdir>
    25b1:	85 c0                	test   %eax,%eax
    25b3:	75 19                	jne    25ce <subdir+0x596>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    25b5:	c7 44 24 04 59 52 00 	movl   $0x5259,0x4(%esp)
    25bc:	00 
    25bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25c4:	e8 ae 1b 00 00       	call   4177 <printf>
    exit();
    25c9:	e8 19 1a 00 00       	call   3fe7 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    25ce:	c7 04 24 10 50 00 00 	movl   $0x5010,(%esp)
    25d5:	e8 75 1a 00 00       	call   404f <mkdir>
    25da:	85 c0                	test   %eax,%eax
    25dc:	75 19                	jne    25f7 <subdir+0x5bf>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    25de:	c7 44 24 04 74 52 00 	movl   $0x5274,0x4(%esp)
    25e5:	00 
    25e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25ed:	e8 85 1b 00 00       	call   4177 <printf>
    exit();
    25f2:	e8 f0 19 00 00       	call   3fe7 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    25f7:	c7 04 24 5a 51 00 00 	movl   $0x515a,(%esp)
    25fe:	e8 34 1a 00 00       	call   4037 <unlink>
    2603:	85 c0                	test   %eax,%eax
    2605:	75 19                	jne    2620 <subdir+0x5e8>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2607:	c7 44 24 04 91 52 00 	movl   $0x5291,0x4(%esp)
    260e:	00 
    260f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2616:	e8 5c 1b 00 00       	call   4177 <printf>
    exit();
    261b:	e8 c7 19 00 00       	call   3fe7 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    2620:	c7 04 24 35 51 00 00 	movl   $0x5135,(%esp)
    2627:	e8 0b 1a 00 00       	call   4037 <unlink>
    262c:	85 c0                	test   %eax,%eax
    262e:	75 19                	jne    2649 <subdir+0x611>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2630:	c7 44 24 04 ad 52 00 	movl   $0x52ad,0x4(%esp)
    2637:	00 
    2638:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    263f:	e8 33 1b 00 00       	call   4177 <printf>
    exit();
    2644:	e8 9e 19 00 00       	call   3fe7 <exit>
  }
  if(chdir("dd/ff") == 0){
    2649:	c7 04 24 48 4f 00 00 	movl   $0x4f48,(%esp)
    2650:	e8 02 1a 00 00       	call   4057 <chdir>
    2655:	85 c0                	test   %eax,%eax
    2657:	75 19                	jne    2672 <subdir+0x63a>
    printf(1, "chdir dd/ff succeeded!\n");
    2659:	c7 44 24 04 c9 52 00 	movl   $0x52c9,0x4(%esp)
    2660:	00 
    2661:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2668:	e8 0a 1b 00 00       	call   4177 <printf>
    exit();
    266d:	e8 75 19 00 00       	call   3fe7 <exit>
  }
  if(chdir("dd/xx") == 0){
    2672:	c7 04 24 e1 52 00 00 	movl   $0x52e1,(%esp)
    2679:	e8 d9 19 00 00       	call   4057 <chdir>
    267e:	85 c0                	test   %eax,%eax
    2680:	75 19                	jne    269b <subdir+0x663>
    printf(1, "chdir dd/xx succeeded!\n");
    2682:	c7 44 24 04 e7 52 00 	movl   $0x52e7,0x4(%esp)
    2689:	00 
    268a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2691:	e8 e1 1a 00 00       	call   4177 <printf>
    exit();
    2696:	e8 4c 19 00 00       	call   3fe7 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    269b:	c7 04 24 10 50 00 00 	movl   $0x5010,(%esp)
    26a2:	e8 90 19 00 00       	call   4037 <unlink>
    26a7:	85 c0                	test   %eax,%eax
    26a9:	74 19                	je     26c4 <subdir+0x68c>
    printf(1, "unlink dd/dd/ff failed\n");
    26ab:	c7 44 24 04 3d 50 00 	movl   $0x503d,0x4(%esp)
    26b2:	00 
    26b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26ba:	e8 b8 1a 00 00       	call   4177 <printf>
    exit();
    26bf:	e8 23 19 00 00       	call   3fe7 <exit>
  }
  if(unlink("dd/ff") != 0){
    26c4:	c7 04 24 48 4f 00 00 	movl   $0x4f48,(%esp)
    26cb:	e8 67 19 00 00       	call   4037 <unlink>
    26d0:	85 c0                	test   %eax,%eax
    26d2:	74 19                	je     26ed <subdir+0x6b5>
    printf(1, "unlink dd/ff failed\n");
    26d4:	c7 44 24 04 ff 52 00 	movl   $0x52ff,0x4(%esp)
    26db:	00 
    26dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26e3:	e8 8f 1a 00 00       	call   4177 <printf>
    exit();
    26e8:	e8 fa 18 00 00       	call   3fe7 <exit>
  }
  if(unlink("dd") == 0){
    26ed:	c7 04 24 2d 4f 00 00 	movl   $0x4f2d,(%esp)
    26f4:	e8 3e 19 00 00       	call   4037 <unlink>
    26f9:	85 c0                	test   %eax,%eax
    26fb:	75 19                	jne    2716 <subdir+0x6de>
    printf(1, "unlink non-empty dd succeeded!\n");
    26fd:	c7 44 24 04 14 53 00 	movl   $0x5314,0x4(%esp)
    2704:	00 
    2705:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    270c:	e8 66 1a 00 00       	call   4177 <printf>
    exit();
    2711:	e8 d1 18 00 00       	call   3fe7 <exit>
  }
  if(unlink("dd/dd") < 0){
    2716:	c7 04 24 34 53 00 00 	movl   $0x5334,(%esp)
    271d:	e8 15 19 00 00       	call   4037 <unlink>
    2722:	85 c0                	test   %eax,%eax
    2724:	79 19                	jns    273f <subdir+0x707>
    printf(1, "unlink dd/dd failed\n");
    2726:	c7 44 24 04 3a 53 00 	movl   $0x533a,0x4(%esp)
    272d:	00 
    272e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2735:	e8 3d 1a 00 00       	call   4177 <printf>
    exit();
    273a:	e8 a8 18 00 00       	call   3fe7 <exit>
  }
  if(unlink("dd") < 0){
    273f:	c7 04 24 2d 4f 00 00 	movl   $0x4f2d,(%esp)
    2746:	e8 ec 18 00 00       	call   4037 <unlink>
    274b:	85 c0                	test   %eax,%eax
    274d:	79 19                	jns    2768 <subdir+0x730>
    printf(1, "unlink dd failed\n");
    274f:	c7 44 24 04 4f 53 00 	movl   $0x534f,0x4(%esp)
    2756:	00 
    2757:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    275e:	e8 14 1a 00 00       	call   4177 <printf>
    exit();
    2763:	e8 7f 18 00 00       	call   3fe7 <exit>
  }

  printf(1, "subdir ok\n");
    2768:	c7 44 24 04 61 53 00 	movl   $0x5361,0x4(%esp)
    276f:	00 
    2770:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2777:	e8 fb 19 00 00       	call   4177 <printf>
}
    277c:	c9                   	leave  
    277d:	c3                   	ret    

0000277e <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    277e:	55                   	push   %ebp
    277f:	89 e5                	mov    %esp,%ebp
    2781:	83 ec 28             	sub    $0x28,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    2784:	c7 44 24 04 6c 53 00 	movl   $0x536c,0x4(%esp)
    278b:	00 
    278c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2793:	e8 df 19 00 00       	call   4177 <printf>

  unlink("bigwrite");
    2798:	c7 04 24 7b 53 00 00 	movl   $0x537b,(%esp)
    279f:	e8 93 18 00 00       	call   4037 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    27a4:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    27ab:	e9 b3 00 00 00       	jmp    2863 <bigwrite+0xe5>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    27b0:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    27b7:	00 
    27b8:	c7 04 24 7b 53 00 00 	movl   $0x537b,(%esp)
    27bf:	e8 63 18 00 00       	call   4027 <open>
    27c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    27c7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    27cb:	79 19                	jns    27e6 <bigwrite+0x68>
      printf(1, "cannot create bigwrite\n");
    27cd:	c7 44 24 04 84 53 00 	movl   $0x5384,0x4(%esp)
    27d4:	00 
    27d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    27dc:	e8 96 19 00 00       	call   4177 <printf>
      exit();
    27e1:	e8 01 18 00 00       	call   3fe7 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    27e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    27ed:	eb 50                	jmp    283f <bigwrite+0xc1>
      int cc = write(fd, buf, sz);
    27ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27f2:	89 44 24 08          	mov    %eax,0x8(%esp)
    27f6:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    27fd:	00 
    27fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2801:	89 04 24             	mov    %eax,(%esp)
    2804:	e8 fe 17 00 00       	call   4007 <write>
    2809:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    280c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    280f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2812:	74 27                	je     283b <bigwrite+0xbd>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2814:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2817:	89 44 24 0c          	mov    %eax,0xc(%esp)
    281b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    281e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2822:	c7 44 24 04 9c 53 00 	movl   $0x539c,0x4(%esp)
    2829:	00 
    282a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2831:	e8 41 19 00 00       	call   4177 <printf>
        exit();
    2836:	e8 ac 17 00 00       	call   3fe7 <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
    283b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    283f:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    2843:	7e aa                	jle    27ef <bigwrite+0x71>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2845:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2848:	89 04 24             	mov    %eax,(%esp)
    284b:	e8 bf 17 00 00       	call   400f <close>
    unlink("bigwrite");
    2850:	c7 04 24 7b 53 00 00 	movl   $0x537b,(%esp)
    2857:	e8 db 17 00 00       	call   4037 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    285c:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    2863:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    286a:	0f 8e 40 ff ff ff    	jle    27b0 <bigwrite+0x32>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    2870:	c7 44 24 04 ae 53 00 	movl   $0x53ae,0x4(%esp)
    2877:	00 
    2878:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    287f:	e8 f3 18 00 00       	call   4177 <printf>
}
    2884:	c9                   	leave  
    2885:	c3                   	ret    

00002886 <bigfile>:

void
bigfile(void)
{
    2886:	55                   	push   %ebp
    2887:	89 e5                	mov    %esp,%ebp
    2889:	83 ec 28             	sub    $0x28,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    288c:	c7 44 24 04 bb 53 00 	movl   $0x53bb,0x4(%esp)
    2893:	00 
    2894:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    289b:	e8 d7 18 00 00       	call   4177 <printf>

  unlink("bigfile");
    28a0:	c7 04 24 c9 53 00 00 	movl   $0x53c9,(%esp)
    28a7:	e8 8b 17 00 00       	call   4037 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    28ac:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    28b3:	00 
    28b4:	c7 04 24 c9 53 00 00 	movl   $0x53c9,(%esp)
    28bb:	e8 67 17 00 00       	call   4027 <open>
    28c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    28c3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    28c7:	79 19                	jns    28e2 <bigfile+0x5c>
    printf(1, "cannot create bigfile");
    28c9:	c7 44 24 04 d1 53 00 	movl   $0x53d1,0x4(%esp)
    28d0:	00 
    28d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28d8:	e8 9a 18 00 00       	call   4177 <printf>
    exit();
    28dd:	e8 05 17 00 00       	call   3fe7 <exit>
  }
  for(i = 0; i < 20; i++){
    28e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    28e9:	eb 5a                	jmp    2945 <bigfile+0xbf>
    memset(buf, i, 600);
    28eb:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    28f2:	00 
    28f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28f6:	89 44 24 04          	mov    %eax,0x4(%esp)
    28fa:	c7 04 24 e0 8b 00 00 	movl   $0x8be0,(%esp)
    2901:	e8 34 15 00 00       	call   3e3a <memset>
    if(write(fd, buf, 600) != 600){
    2906:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    290d:	00 
    290e:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    2915:	00 
    2916:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2919:	89 04 24             	mov    %eax,(%esp)
    291c:	e8 e6 16 00 00       	call   4007 <write>
    2921:	3d 58 02 00 00       	cmp    $0x258,%eax
    2926:	74 19                	je     2941 <bigfile+0xbb>
      printf(1, "write bigfile failed\n");
    2928:	c7 44 24 04 e7 53 00 	movl   $0x53e7,0x4(%esp)
    292f:	00 
    2930:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2937:	e8 3b 18 00 00       	call   4177 <printf>
      exit();
    293c:	e8 a6 16 00 00       	call   3fe7 <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    2941:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2945:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    2949:	7e a0                	jle    28eb <bigfile+0x65>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    294b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    294e:	89 04 24             	mov    %eax,(%esp)
    2951:	e8 b9 16 00 00       	call   400f <close>

  fd = open("bigfile", 0);
    2956:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    295d:	00 
    295e:	c7 04 24 c9 53 00 00 	movl   $0x53c9,(%esp)
    2965:	e8 bd 16 00 00       	call   4027 <open>
    296a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    296d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2971:	79 19                	jns    298c <bigfile+0x106>
    printf(1, "cannot open bigfile\n");
    2973:	c7 44 24 04 fd 53 00 	movl   $0x53fd,0x4(%esp)
    297a:	00 
    297b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2982:	e8 f0 17 00 00       	call   4177 <printf>
    exit();
    2987:	e8 5b 16 00 00       	call   3fe7 <exit>
  }
  total = 0;
    298c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    2993:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    299a:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    29a1:	00 
    29a2:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    29a9:	00 
    29aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29ad:	89 04 24             	mov    %eax,(%esp)
    29b0:	e8 4a 16 00 00       	call   3fff <read>
    29b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    29b8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    29bc:	79 19                	jns    29d7 <bigfile+0x151>
      printf(1, "read bigfile failed\n");
    29be:	c7 44 24 04 12 54 00 	movl   $0x5412,0x4(%esp)
    29c5:	00 
    29c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29cd:	e8 a5 17 00 00       	call   4177 <printf>
      exit();
    29d2:	e8 10 16 00 00       	call   3fe7 <exit>
    }
    if(cc == 0)
    29d7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    29db:	75 1b                	jne    29f8 <bigfile+0x172>
      break;
    29dd:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    29de:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29e1:	89 04 24             	mov    %eax,(%esp)
    29e4:	e8 26 16 00 00       	call   400f <close>
  if(total != 20*600){
    29e9:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    29f0:	0f 84 99 00 00 00    	je     2a8f <bigfile+0x209>
    29f6:	eb 7e                	jmp    2a76 <bigfile+0x1f0>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    29f8:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    29ff:	74 19                	je     2a1a <bigfile+0x194>
      printf(1, "short read bigfile\n");
    2a01:	c7 44 24 04 27 54 00 	movl   $0x5427,0x4(%esp)
    2a08:	00 
    2a09:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a10:	e8 62 17 00 00       	call   4177 <printf>
      exit();
    2a15:	e8 cd 15 00 00       	call   3fe7 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    2a1a:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    2a21:	0f be d0             	movsbl %al,%edx
    2a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a27:	89 c1                	mov    %eax,%ecx
    2a29:	c1 e9 1f             	shr    $0x1f,%ecx
    2a2c:	01 c8                	add    %ecx,%eax
    2a2e:	d1 f8                	sar    %eax
    2a30:	39 c2                	cmp    %eax,%edx
    2a32:	75 1a                	jne    2a4e <bigfile+0x1c8>
    2a34:	0f b6 05 0b 8d 00 00 	movzbl 0x8d0b,%eax
    2a3b:	0f be d0             	movsbl %al,%edx
    2a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a41:	89 c1                	mov    %eax,%ecx
    2a43:	c1 e9 1f             	shr    $0x1f,%ecx
    2a46:	01 c8                	add    %ecx,%eax
    2a48:	d1 f8                	sar    %eax
    2a4a:	39 c2                	cmp    %eax,%edx
    2a4c:	74 19                	je     2a67 <bigfile+0x1e1>
      printf(1, "read bigfile wrong data\n");
    2a4e:	c7 44 24 04 3b 54 00 	movl   $0x543b,0x4(%esp)
    2a55:	00 
    2a56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a5d:	e8 15 17 00 00       	call   4177 <printf>
      exit();
    2a62:	e8 80 15 00 00       	call   3fe7 <exit>
    }
    total += cc;
    2a67:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a6a:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    2a6d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
    2a71:	e9 24 ff ff ff       	jmp    299a <bigfile+0x114>
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2a76:	c7 44 24 04 54 54 00 	movl   $0x5454,0x4(%esp)
    2a7d:	00 
    2a7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a85:	e8 ed 16 00 00       	call   4177 <printf>
    exit();
    2a8a:	e8 58 15 00 00       	call   3fe7 <exit>
  }
  unlink("bigfile");
    2a8f:	c7 04 24 c9 53 00 00 	movl   $0x53c9,(%esp)
    2a96:	e8 9c 15 00 00       	call   4037 <unlink>

  printf(1, "bigfile test ok\n");
    2a9b:	c7 44 24 04 6e 54 00 	movl   $0x546e,0x4(%esp)
    2aa2:	00 
    2aa3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aaa:	e8 c8 16 00 00       	call   4177 <printf>
}
    2aaf:	c9                   	leave  
    2ab0:	c3                   	ret    

00002ab1 <fourteen>:

void
fourteen(void)
{
    2ab1:	55                   	push   %ebp
    2ab2:	89 e5                	mov    %esp,%ebp
    2ab4:	83 ec 28             	sub    $0x28,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2ab7:	c7 44 24 04 7f 54 00 	movl   $0x547f,0x4(%esp)
    2abe:	00 
    2abf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ac6:	e8 ac 16 00 00       	call   4177 <printf>

  if(mkdir("12345678901234") != 0){
    2acb:	c7 04 24 8e 54 00 00 	movl   $0x548e,(%esp)
    2ad2:	e8 78 15 00 00       	call   404f <mkdir>
    2ad7:	85 c0                	test   %eax,%eax
    2ad9:	74 19                	je     2af4 <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    2adb:	c7 44 24 04 9d 54 00 	movl   $0x549d,0x4(%esp)
    2ae2:	00 
    2ae3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aea:	e8 88 16 00 00       	call   4177 <printf>
    exit();
    2aef:	e8 f3 14 00 00       	call   3fe7 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2af4:	c7 04 24 bc 54 00 00 	movl   $0x54bc,(%esp)
    2afb:	e8 4f 15 00 00       	call   404f <mkdir>
    2b00:	85 c0                	test   %eax,%eax
    2b02:	74 19                	je     2b1d <fourteen+0x6c>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2b04:	c7 44 24 04 dc 54 00 	movl   $0x54dc,0x4(%esp)
    2b0b:	00 
    2b0c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b13:	e8 5f 16 00 00       	call   4177 <printf>
    exit();
    2b18:	e8 ca 14 00 00       	call   3fe7 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2b1d:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2b24:	00 
    2b25:	c7 04 24 0c 55 00 00 	movl   $0x550c,(%esp)
    2b2c:	e8 f6 14 00 00       	call   4027 <open>
    2b31:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2b34:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b38:	79 19                	jns    2b53 <fourteen+0xa2>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2b3a:	c7 44 24 04 3c 55 00 	movl   $0x553c,0x4(%esp)
    2b41:	00 
    2b42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b49:	e8 29 16 00 00       	call   4177 <printf>
    exit();
    2b4e:	e8 94 14 00 00       	call   3fe7 <exit>
  }
  close(fd);
    2b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b56:	89 04 24             	mov    %eax,(%esp)
    2b59:	e8 b1 14 00 00       	call   400f <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2b5e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b65:	00 
    2b66:	c7 04 24 7c 55 00 00 	movl   $0x557c,(%esp)
    2b6d:	e8 b5 14 00 00       	call   4027 <open>
    2b72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2b75:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b79:	79 19                	jns    2b94 <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2b7b:	c7 44 24 04 ac 55 00 	movl   $0x55ac,0x4(%esp)
    2b82:	00 
    2b83:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b8a:	e8 e8 15 00 00       	call   4177 <printf>
    exit();
    2b8f:	e8 53 14 00 00       	call   3fe7 <exit>
  }
  close(fd);
    2b94:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b97:	89 04 24             	mov    %eax,(%esp)
    2b9a:	e8 70 14 00 00       	call   400f <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2b9f:	c7 04 24 e6 55 00 00 	movl   $0x55e6,(%esp)
    2ba6:	e8 a4 14 00 00       	call   404f <mkdir>
    2bab:	85 c0                	test   %eax,%eax
    2bad:	75 19                	jne    2bc8 <fourteen+0x117>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2baf:	c7 44 24 04 04 56 00 	movl   $0x5604,0x4(%esp)
    2bb6:	00 
    2bb7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bbe:	e8 b4 15 00 00       	call   4177 <printf>
    exit();
    2bc3:	e8 1f 14 00 00       	call   3fe7 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2bc8:	c7 04 24 34 56 00 00 	movl   $0x5634,(%esp)
    2bcf:	e8 7b 14 00 00       	call   404f <mkdir>
    2bd4:	85 c0                	test   %eax,%eax
    2bd6:	75 19                	jne    2bf1 <fourteen+0x140>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2bd8:	c7 44 24 04 54 56 00 	movl   $0x5654,0x4(%esp)
    2bdf:	00 
    2be0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2be7:	e8 8b 15 00 00       	call   4177 <printf>
    exit();
    2bec:	e8 f6 13 00 00       	call   3fe7 <exit>
  }

  printf(1, "fourteen ok\n");
    2bf1:	c7 44 24 04 85 56 00 	movl   $0x5685,0x4(%esp)
    2bf8:	00 
    2bf9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c00:	e8 72 15 00 00       	call   4177 <printf>
}
    2c05:	c9                   	leave  
    2c06:	c3                   	ret    

00002c07 <rmdot>:

void
rmdot(void)
{
    2c07:	55                   	push   %ebp
    2c08:	89 e5                	mov    %esp,%ebp
    2c0a:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    2c0d:	c7 44 24 04 92 56 00 	movl   $0x5692,0x4(%esp)
    2c14:	00 
    2c15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c1c:	e8 56 15 00 00       	call   4177 <printf>
  if(mkdir("dots") != 0){
    2c21:	c7 04 24 9e 56 00 00 	movl   $0x569e,(%esp)
    2c28:	e8 22 14 00 00       	call   404f <mkdir>
    2c2d:	85 c0                	test   %eax,%eax
    2c2f:	74 19                	je     2c4a <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    2c31:	c7 44 24 04 a3 56 00 	movl   $0x56a3,0x4(%esp)
    2c38:	00 
    2c39:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c40:	e8 32 15 00 00       	call   4177 <printf>
    exit();
    2c45:	e8 9d 13 00 00       	call   3fe7 <exit>
  }
  if(chdir("dots") != 0){
    2c4a:	c7 04 24 9e 56 00 00 	movl   $0x569e,(%esp)
    2c51:	e8 01 14 00 00       	call   4057 <chdir>
    2c56:	85 c0                	test   %eax,%eax
    2c58:	74 19                	je     2c73 <rmdot+0x6c>
    printf(1, "chdir dots failed\n");
    2c5a:	c7 44 24 04 b6 56 00 	movl   $0x56b6,0x4(%esp)
    2c61:	00 
    2c62:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c69:	e8 09 15 00 00       	call   4177 <printf>
    exit();
    2c6e:	e8 74 13 00 00       	call   3fe7 <exit>
  }
  if(unlink(".") == 0){
    2c73:	c7 04 24 cf 4d 00 00 	movl   $0x4dcf,(%esp)
    2c7a:	e8 b8 13 00 00       	call   4037 <unlink>
    2c7f:	85 c0                	test   %eax,%eax
    2c81:	75 19                	jne    2c9c <rmdot+0x95>
    printf(1, "rm . worked!\n");
    2c83:	c7 44 24 04 c9 56 00 	movl   $0x56c9,0x4(%esp)
    2c8a:	00 
    2c8b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c92:	e8 e0 14 00 00       	call   4177 <printf>
    exit();
    2c97:	e8 4b 13 00 00       	call   3fe7 <exit>
  }
  if(unlink("..") == 0){
    2c9c:	c7 04 24 62 49 00 00 	movl   $0x4962,(%esp)
    2ca3:	e8 8f 13 00 00       	call   4037 <unlink>
    2ca8:	85 c0                	test   %eax,%eax
    2caa:	75 19                	jne    2cc5 <rmdot+0xbe>
    printf(1, "rm .. worked!\n");
    2cac:	c7 44 24 04 d7 56 00 	movl   $0x56d7,0x4(%esp)
    2cb3:	00 
    2cb4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cbb:	e8 b7 14 00 00       	call   4177 <printf>
    exit();
    2cc0:	e8 22 13 00 00       	call   3fe7 <exit>
  }
  if(chdir("/") != 0){
    2cc5:	c7 04 24 b6 45 00 00 	movl   $0x45b6,(%esp)
    2ccc:	e8 86 13 00 00       	call   4057 <chdir>
    2cd1:	85 c0                	test   %eax,%eax
    2cd3:	74 19                	je     2cee <rmdot+0xe7>
    printf(1, "chdir / failed\n");
    2cd5:	c7 44 24 04 b8 45 00 	movl   $0x45b8,0x4(%esp)
    2cdc:	00 
    2cdd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ce4:	e8 8e 14 00 00       	call   4177 <printf>
    exit();
    2ce9:	e8 f9 12 00 00       	call   3fe7 <exit>
  }
  if(unlink("dots/.") == 0){
    2cee:	c7 04 24 e6 56 00 00 	movl   $0x56e6,(%esp)
    2cf5:	e8 3d 13 00 00       	call   4037 <unlink>
    2cfa:	85 c0                	test   %eax,%eax
    2cfc:	75 19                	jne    2d17 <rmdot+0x110>
    printf(1, "unlink dots/. worked!\n");
    2cfe:	c7 44 24 04 ed 56 00 	movl   $0x56ed,0x4(%esp)
    2d05:	00 
    2d06:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d0d:	e8 65 14 00 00       	call   4177 <printf>
    exit();
    2d12:	e8 d0 12 00 00       	call   3fe7 <exit>
  }
  if(unlink("dots/..") == 0){
    2d17:	c7 04 24 04 57 00 00 	movl   $0x5704,(%esp)
    2d1e:	e8 14 13 00 00       	call   4037 <unlink>
    2d23:	85 c0                	test   %eax,%eax
    2d25:	75 19                	jne    2d40 <rmdot+0x139>
    printf(1, "unlink dots/.. worked!\n");
    2d27:	c7 44 24 04 0c 57 00 	movl   $0x570c,0x4(%esp)
    2d2e:	00 
    2d2f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d36:	e8 3c 14 00 00       	call   4177 <printf>
    exit();
    2d3b:	e8 a7 12 00 00       	call   3fe7 <exit>
  }
  if(unlink("dots") != 0){
    2d40:	c7 04 24 9e 56 00 00 	movl   $0x569e,(%esp)
    2d47:	e8 eb 12 00 00       	call   4037 <unlink>
    2d4c:	85 c0                	test   %eax,%eax
    2d4e:	74 19                	je     2d69 <rmdot+0x162>
    printf(1, "unlink dots failed!\n");
    2d50:	c7 44 24 04 24 57 00 	movl   $0x5724,0x4(%esp)
    2d57:	00 
    2d58:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d5f:	e8 13 14 00 00       	call   4177 <printf>
    exit();
    2d64:	e8 7e 12 00 00       	call   3fe7 <exit>
  }
  printf(1, "rmdot ok\n");
    2d69:	c7 44 24 04 39 57 00 	movl   $0x5739,0x4(%esp)
    2d70:	00 
    2d71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d78:	e8 fa 13 00 00       	call   4177 <printf>
}
    2d7d:	c9                   	leave  
    2d7e:	c3                   	ret    

00002d7f <dirfile>:

void
dirfile(void)
{
    2d7f:	55                   	push   %ebp
    2d80:	89 e5                	mov    %esp,%ebp
    2d82:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "dir vs file\n");
    2d85:	c7 44 24 04 43 57 00 	movl   $0x5743,0x4(%esp)
    2d8c:	00 
    2d8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d94:	e8 de 13 00 00       	call   4177 <printf>

  fd = open("dirfile", O_CREATE);
    2d99:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2da0:	00 
    2da1:	c7 04 24 50 57 00 00 	movl   $0x5750,(%esp)
    2da8:	e8 7a 12 00 00       	call   4027 <open>
    2dad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2db0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2db4:	79 19                	jns    2dcf <dirfile+0x50>
    printf(1, "create dirfile failed\n");
    2db6:	c7 44 24 04 58 57 00 	movl   $0x5758,0x4(%esp)
    2dbd:	00 
    2dbe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dc5:	e8 ad 13 00 00       	call   4177 <printf>
    exit();
    2dca:	e8 18 12 00 00       	call   3fe7 <exit>
  }
  close(fd);
    2dcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dd2:	89 04 24             	mov    %eax,(%esp)
    2dd5:	e8 35 12 00 00       	call   400f <close>
  if(chdir("dirfile") == 0){
    2dda:	c7 04 24 50 57 00 00 	movl   $0x5750,(%esp)
    2de1:	e8 71 12 00 00       	call   4057 <chdir>
    2de6:	85 c0                	test   %eax,%eax
    2de8:	75 19                	jne    2e03 <dirfile+0x84>
    printf(1, "chdir dirfile succeeded!\n");
    2dea:	c7 44 24 04 6f 57 00 	movl   $0x576f,0x4(%esp)
    2df1:	00 
    2df2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2df9:	e8 79 13 00 00       	call   4177 <printf>
    exit();
    2dfe:	e8 e4 11 00 00       	call   3fe7 <exit>
  }
  fd = open("dirfile/xx", 0);
    2e03:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2e0a:	00 
    2e0b:	c7 04 24 89 57 00 00 	movl   $0x5789,(%esp)
    2e12:	e8 10 12 00 00       	call   4027 <open>
    2e17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2e1a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e1e:	78 19                	js     2e39 <dirfile+0xba>
    printf(1, "create dirfile/xx succeeded!\n");
    2e20:	c7 44 24 04 94 57 00 	movl   $0x5794,0x4(%esp)
    2e27:	00 
    2e28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e2f:	e8 43 13 00 00       	call   4177 <printf>
    exit();
    2e34:	e8 ae 11 00 00       	call   3fe7 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2e39:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2e40:	00 
    2e41:	c7 04 24 89 57 00 00 	movl   $0x5789,(%esp)
    2e48:	e8 da 11 00 00       	call   4027 <open>
    2e4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2e50:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e54:	78 19                	js     2e6f <dirfile+0xf0>
    printf(1, "create dirfile/xx succeeded!\n");
    2e56:	c7 44 24 04 94 57 00 	movl   $0x5794,0x4(%esp)
    2e5d:	00 
    2e5e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e65:	e8 0d 13 00 00       	call   4177 <printf>
    exit();
    2e6a:	e8 78 11 00 00       	call   3fe7 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2e6f:	c7 04 24 89 57 00 00 	movl   $0x5789,(%esp)
    2e76:	e8 d4 11 00 00       	call   404f <mkdir>
    2e7b:	85 c0                	test   %eax,%eax
    2e7d:	75 19                	jne    2e98 <dirfile+0x119>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2e7f:	c7 44 24 04 b2 57 00 	movl   $0x57b2,0x4(%esp)
    2e86:	00 
    2e87:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e8e:	e8 e4 12 00 00       	call   4177 <printf>
    exit();
    2e93:	e8 4f 11 00 00       	call   3fe7 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2e98:	c7 04 24 89 57 00 00 	movl   $0x5789,(%esp)
    2e9f:	e8 93 11 00 00       	call   4037 <unlink>
    2ea4:	85 c0                	test   %eax,%eax
    2ea6:	75 19                	jne    2ec1 <dirfile+0x142>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2ea8:	c7 44 24 04 cf 57 00 	movl   $0x57cf,0x4(%esp)
    2eaf:	00 
    2eb0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2eb7:	e8 bb 12 00 00       	call   4177 <printf>
    exit();
    2ebc:	e8 26 11 00 00       	call   3fe7 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2ec1:	c7 44 24 04 89 57 00 	movl   $0x5789,0x4(%esp)
    2ec8:	00 
    2ec9:	c7 04 24 ed 57 00 00 	movl   $0x57ed,(%esp)
    2ed0:	e8 72 11 00 00       	call   4047 <link>
    2ed5:	85 c0                	test   %eax,%eax
    2ed7:	75 19                	jne    2ef2 <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    2ed9:	c7 44 24 04 f4 57 00 	movl   $0x57f4,0x4(%esp)
    2ee0:	00 
    2ee1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ee8:	e8 8a 12 00 00       	call   4177 <printf>
    exit();
    2eed:	e8 f5 10 00 00       	call   3fe7 <exit>
  }
  if(unlink("dirfile") != 0){
    2ef2:	c7 04 24 50 57 00 00 	movl   $0x5750,(%esp)
    2ef9:	e8 39 11 00 00       	call   4037 <unlink>
    2efe:	85 c0                	test   %eax,%eax
    2f00:	74 19                	je     2f1b <dirfile+0x19c>
    printf(1, "unlink dirfile failed!\n");
    2f02:	c7 44 24 04 13 58 00 	movl   $0x5813,0x4(%esp)
    2f09:	00 
    2f0a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f11:	e8 61 12 00 00       	call   4177 <printf>
    exit();
    2f16:	e8 cc 10 00 00       	call   3fe7 <exit>
  }

  fd = open(".", O_RDWR);
    2f1b:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    2f22:	00 
    2f23:	c7 04 24 cf 4d 00 00 	movl   $0x4dcf,(%esp)
    2f2a:	e8 f8 10 00 00       	call   4027 <open>
    2f2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2f32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2f36:	78 19                	js     2f51 <dirfile+0x1d2>
    printf(1, "open . for writing succeeded!\n");
    2f38:	c7 44 24 04 2c 58 00 	movl   $0x582c,0x4(%esp)
    2f3f:	00 
    2f40:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f47:	e8 2b 12 00 00       	call   4177 <printf>
    exit();
    2f4c:	e8 96 10 00 00       	call   3fe7 <exit>
  }
  fd = open(".", 0);
    2f51:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2f58:	00 
    2f59:	c7 04 24 cf 4d 00 00 	movl   $0x4dcf,(%esp)
    2f60:	e8 c2 10 00 00       	call   4027 <open>
    2f65:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    2f68:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2f6f:	00 
    2f70:	c7 44 24 04 1b 4a 00 	movl   $0x4a1b,0x4(%esp)
    2f77:	00 
    2f78:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f7b:	89 04 24             	mov    %eax,(%esp)
    2f7e:	e8 84 10 00 00       	call   4007 <write>
    2f83:	85 c0                	test   %eax,%eax
    2f85:	7e 19                	jle    2fa0 <dirfile+0x221>
    printf(1, "write . succeeded!\n");
    2f87:	c7 44 24 04 4b 58 00 	movl   $0x584b,0x4(%esp)
    2f8e:	00 
    2f8f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f96:	e8 dc 11 00 00       	call   4177 <printf>
    exit();
    2f9b:	e8 47 10 00 00       	call   3fe7 <exit>
  }
  close(fd);
    2fa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fa3:	89 04 24             	mov    %eax,(%esp)
    2fa6:	e8 64 10 00 00       	call   400f <close>

  printf(1, "dir vs file OK\n");
    2fab:	c7 44 24 04 5f 58 00 	movl   $0x585f,0x4(%esp)
    2fb2:	00 
    2fb3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fba:	e8 b8 11 00 00       	call   4177 <printf>
}
    2fbf:	c9                   	leave  
    2fc0:	c3                   	ret    

00002fc1 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2fc1:	55                   	push   %ebp
    2fc2:	89 e5                	mov    %esp,%ebp
    2fc4:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2fc7:	c7 44 24 04 6f 58 00 	movl   $0x586f,0x4(%esp)
    2fce:	00 
    2fcf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fd6:	e8 9c 11 00 00       	call   4177 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2fdb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2fe2:	e9 d2 00 00 00       	jmp    30b9 <iref+0xf8>
    if(mkdir("irefd") != 0){
    2fe7:	c7 04 24 80 58 00 00 	movl   $0x5880,(%esp)
    2fee:	e8 5c 10 00 00       	call   404f <mkdir>
    2ff3:	85 c0                	test   %eax,%eax
    2ff5:	74 19                	je     3010 <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    2ff7:	c7 44 24 04 86 58 00 	movl   $0x5886,0x4(%esp)
    2ffe:	00 
    2fff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3006:	e8 6c 11 00 00       	call   4177 <printf>
      exit();
    300b:	e8 d7 0f 00 00       	call   3fe7 <exit>
    }
    if(chdir("irefd") != 0){
    3010:	c7 04 24 80 58 00 00 	movl   $0x5880,(%esp)
    3017:	e8 3b 10 00 00       	call   4057 <chdir>
    301c:	85 c0                	test   %eax,%eax
    301e:	74 19                	je     3039 <iref+0x78>
      printf(1, "chdir irefd failed\n");
    3020:	c7 44 24 04 9a 58 00 	movl   $0x589a,0x4(%esp)
    3027:	00 
    3028:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    302f:	e8 43 11 00 00       	call   4177 <printf>
      exit();
    3034:	e8 ae 0f 00 00       	call   3fe7 <exit>
    }

    mkdir("");
    3039:	c7 04 24 ae 58 00 00 	movl   $0x58ae,(%esp)
    3040:	e8 0a 10 00 00       	call   404f <mkdir>
    link("README", "");
    3045:	c7 44 24 04 ae 58 00 	movl   $0x58ae,0x4(%esp)
    304c:	00 
    304d:	c7 04 24 ed 57 00 00 	movl   $0x57ed,(%esp)
    3054:	e8 ee 0f 00 00       	call   4047 <link>
    fd = open("", O_CREATE);
    3059:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3060:	00 
    3061:	c7 04 24 ae 58 00 00 	movl   $0x58ae,(%esp)
    3068:	e8 ba 0f 00 00       	call   4027 <open>
    306d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    3070:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3074:	78 0b                	js     3081 <iref+0xc0>
      close(fd);
    3076:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3079:	89 04 24             	mov    %eax,(%esp)
    307c:	e8 8e 0f 00 00       	call   400f <close>
    fd = open("xx", O_CREATE);
    3081:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3088:	00 
    3089:	c7 04 24 af 58 00 00 	movl   $0x58af,(%esp)
    3090:	e8 92 0f 00 00       	call   4027 <open>
    3095:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    3098:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    309c:	78 0b                	js     30a9 <iref+0xe8>
      close(fd);
    309e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    30a1:	89 04 24             	mov    %eax,(%esp)
    30a4:	e8 66 0f 00 00       	call   400f <close>
    unlink("xx");
    30a9:	c7 04 24 af 58 00 00 	movl   $0x58af,(%esp)
    30b0:	e8 82 0f 00 00       	call   4037 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    30b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    30b9:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    30bd:	0f 8e 24 ff ff ff    	jle    2fe7 <iref+0x26>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    30c3:	c7 04 24 b6 45 00 00 	movl   $0x45b6,(%esp)
    30ca:	e8 88 0f 00 00       	call   4057 <chdir>
  printf(1, "empty file name OK\n");
    30cf:	c7 44 24 04 b2 58 00 	movl   $0x58b2,0x4(%esp)
    30d6:	00 
    30d7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30de:	e8 94 10 00 00       	call   4177 <printf>
}
    30e3:	c9                   	leave  
    30e4:	c3                   	ret    

000030e5 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    30e5:	55                   	push   %ebp
    30e6:	89 e5                	mov    %esp,%ebp
    30e8:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
    30eb:	c7 44 24 04 c6 58 00 	movl   $0x58c6,0x4(%esp)
    30f2:	00 
    30f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30fa:	e8 78 10 00 00       	call   4177 <printf>

  for(n=0; n<1000; n++){
    30ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3106:	eb 2e                	jmp    3136 <forktest+0x51>
    pid = fork(0,0);
    3108:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    310f:	00 
    3110:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3117:	e8 c3 0e 00 00       	call   3fdf <fork>
    311c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    311f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3123:	79 02                	jns    3127 <forktest+0x42>
      break;
    3125:	eb 18                	jmp    313f <forktest+0x5a>
    if(pid == 0)
    3127:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    312b:	75 05                	jne    3132 <forktest+0x4d>
      exit();
    312d:	e8 b5 0e 00 00       	call   3fe7 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3132:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3136:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    313d:	7e c9                	jle    3108 <forktest+0x23>
      break;
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    313f:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    3146:	75 19                	jne    3161 <forktest+0x7c>
    printf(1, "fork claimed to work 1000 times!\n");
    3148:	c7 44 24 04 d4 58 00 	movl   $0x58d4,0x4(%esp)
    314f:	00 
    3150:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3157:	e8 1b 10 00 00       	call   4177 <printf>
    exit();
    315c:	e8 86 0e 00 00       	call   3fe7 <exit>
  }
  
  for(; n > 0; n--){
    3161:	eb 26                	jmp    3189 <forktest+0xa4>
    if(wait() < 0){
    3163:	e8 87 0e 00 00       	call   3fef <wait>
    3168:	85 c0                	test   %eax,%eax
    316a:	79 19                	jns    3185 <forktest+0xa0>
      printf(1, "wait stopped early\n");
    316c:	c7 44 24 04 f6 58 00 	movl   $0x58f6,0x4(%esp)
    3173:	00 
    3174:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    317b:	e8 f7 0f 00 00       	call   4177 <printf>
      exit();
    3180:	e8 62 0e 00 00       	call   3fe7 <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    3185:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3189:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    318d:	7f d4                	jg     3163 <forktest+0x7e>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    318f:	e8 5b 0e 00 00       	call   3fef <wait>
    3194:	83 f8 ff             	cmp    $0xffffffff,%eax
    3197:	74 19                	je     31b2 <forktest+0xcd>
    printf(1, "wait got too many\n");
    3199:	c7 44 24 04 0a 59 00 	movl   $0x590a,0x4(%esp)
    31a0:	00 
    31a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31a8:	e8 ca 0f 00 00       	call   4177 <printf>
    exit();
    31ad:	e8 35 0e 00 00       	call   3fe7 <exit>
  }
  
  printf(1, "fork test OK\n");
    31b2:	c7 44 24 04 1d 59 00 	movl   $0x591d,0x4(%esp)
    31b9:	00 
    31ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31c1:	e8 b1 0f 00 00       	call   4177 <printf>
}
    31c6:	c9                   	leave  
    31c7:	c3                   	ret    

000031c8 <sbrktest>:

void
sbrktest(void)
{
    31c8:	55                   	push   %ebp
    31c9:	89 e5                	mov    %esp,%ebp
    31cb:	53                   	push   %ebx
    31cc:	81 ec 84 00 00 00    	sub    $0x84,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    31d2:	a1 04 64 00 00       	mov    0x6404,%eax
    31d7:	c7 44 24 04 2b 59 00 	movl   $0x592b,0x4(%esp)
    31de:	00 
    31df:	89 04 24             	mov    %eax,(%esp)
    31e2:	e8 90 0f 00 00       	call   4177 <printf>
  oldbrk = sbrk(0);
    31e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31ee:	e8 7c 0e 00 00       	call   406f <sbrk>
    31f3:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    31f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31fd:	e8 6d 0e 00 00       	call   406f <sbrk>
    3202:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    3205:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    320c:	eb 59                	jmp    3267 <sbrktest+0x9f>
    b = sbrk(1);
    320e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3215:	e8 55 0e 00 00       	call   406f <sbrk>
    321a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(b != a){
    321d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3220:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3223:	74 2f                	je     3254 <sbrktest+0x8c>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3225:	a1 04 64 00 00       	mov    0x6404,%eax
    322a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    322d:	89 54 24 10          	mov    %edx,0x10(%esp)
    3231:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3234:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3238:	8b 55 f0             	mov    -0x10(%ebp),%edx
    323b:	89 54 24 08          	mov    %edx,0x8(%esp)
    323f:	c7 44 24 04 36 59 00 	movl   $0x5936,0x4(%esp)
    3246:	00 
    3247:	89 04 24             	mov    %eax,(%esp)
    324a:	e8 28 0f 00 00       	call   4177 <printf>
      exit();
    324f:	e8 93 0d 00 00       	call   3fe7 <exit>
    }
    *b = 1;
    3254:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3257:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    325a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    325d:	83 c0 01             	add    $0x1,%eax
    3260:	89 45 f4             	mov    %eax,-0xc(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    3263:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3267:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    326e:	7e 9e                	jle    320e <sbrktest+0x46>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork(0,0);
    3270:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3277:	00 
    3278:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    327f:	e8 5b 0d 00 00       	call   3fdf <fork>
    3284:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    3287:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    328b:	79 1a                	jns    32a7 <sbrktest+0xdf>
    printf(stdout, "sbrk test fork failed\n");
    328d:	a1 04 64 00 00       	mov    0x6404,%eax
    3292:	c7 44 24 04 51 59 00 	movl   $0x5951,0x4(%esp)
    3299:	00 
    329a:	89 04 24             	mov    %eax,(%esp)
    329d:	e8 d5 0e 00 00       	call   4177 <printf>
    exit();
    32a2:	e8 40 0d 00 00       	call   3fe7 <exit>
  }
  c = sbrk(1);
    32a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    32ae:	e8 bc 0d 00 00       	call   406f <sbrk>
    32b3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    32b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    32bd:	e8 ad 0d 00 00       	call   406f <sbrk>
    32c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    32c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32c8:	83 c0 01             	add    $0x1,%eax
    32cb:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    32ce:	74 1a                	je     32ea <sbrktest+0x122>
    printf(stdout, "sbrk test failed post-fork\n");
    32d0:	a1 04 64 00 00       	mov    0x6404,%eax
    32d5:	c7 44 24 04 68 59 00 	movl   $0x5968,0x4(%esp)
    32dc:	00 
    32dd:	89 04 24             	mov    %eax,(%esp)
    32e0:	e8 92 0e 00 00       	call   4177 <printf>
    exit();
    32e5:	e8 fd 0c 00 00       	call   3fe7 <exit>
  }
  if(pid == 0)
    32ea:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    32ee:	75 05                	jne    32f5 <sbrktest+0x12d>
    exit();
    32f0:	e8 f2 0c 00 00       	call   3fe7 <exit>
  wait();
    32f5:	e8 f5 0c 00 00       	call   3fef <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    32fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3301:	e8 69 0d 00 00       	call   406f <sbrk>
    3306:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    3309:	8b 45 f4             	mov    -0xc(%ebp),%eax
    330c:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3311:	29 c2                	sub    %eax,%edx
    3313:	89 d0                	mov    %edx,%eax
    3315:	89 45 dc             	mov    %eax,-0x24(%ebp)
  p = sbrk(amt);
    3318:	8b 45 dc             	mov    -0x24(%ebp),%eax
    331b:	89 04 24             	mov    %eax,(%esp)
    331e:	e8 4c 0d 00 00       	call   406f <sbrk>
    3323:	89 45 d8             	mov    %eax,-0x28(%ebp)
  if (p != a) { 
    3326:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3329:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    332c:	74 1a                	je     3348 <sbrktest+0x180>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    332e:	a1 04 64 00 00       	mov    0x6404,%eax
    3333:	c7 44 24 04 84 59 00 	movl   $0x5984,0x4(%esp)
    333a:	00 
    333b:	89 04 24             	mov    %eax,(%esp)
    333e:	e8 34 0e 00 00       	call   4177 <printf>
    exit();
    3343:	e8 9f 0c 00 00       	call   3fe7 <exit>
  }
  lastaddr = (char*) (BIG-1);
    3348:	c7 45 d4 ff ff 3f 06 	movl   $0x63fffff,-0x2c(%ebp)
  *lastaddr = 99;
    334f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3352:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    3355:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    335c:	e8 0e 0d 00 00       	call   406f <sbrk>
    3361:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    3364:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    336b:	e8 ff 0c 00 00       	call   406f <sbrk>
    3370:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    3373:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3377:	75 1a                	jne    3393 <sbrktest+0x1cb>
    printf(stdout, "sbrk could not deallocate\n");
    3379:	a1 04 64 00 00       	mov    0x6404,%eax
    337e:	c7 44 24 04 c2 59 00 	movl   $0x59c2,0x4(%esp)
    3385:	00 
    3386:	89 04 24             	mov    %eax,(%esp)
    3389:	e8 e9 0d 00 00       	call   4177 <printf>
    exit();
    338e:	e8 54 0c 00 00       	call   3fe7 <exit>
  }
  c = sbrk(0);
    3393:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    339a:	e8 d0 0c 00 00       	call   406f <sbrk>
    339f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    33a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33a5:	2d 00 10 00 00       	sub    $0x1000,%eax
    33aa:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    33ad:	74 28                	je     33d7 <sbrktest+0x20f>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    33af:	a1 04 64 00 00       	mov    0x6404,%eax
    33b4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    33b7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    33bb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    33be:	89 54 24 08          	mov    %edx,0x8(%esp)
    33c2:	c7 44 24 04 e0 59 00 	movl   $0x59e0,0x4(%esp)
    33c9:	00 
    33ca:	89 04 24             	mov    %eax,(%esp)
    33cd:	e8 a5 0d 00 00       	call   4177 <printf>
    exit();
    33d2:	e8 10 0c 00 00       	call   3fe7 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    33d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33de:	e8 8c 0c 00 00       	call   406f <sbrk>
    33e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    33e6:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    33ed:	e8 7d 0c 00 00       	call   406f <sbrk>
    33f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    33f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    33f8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    33fb:	75 19                	jne    3416 <sbrktest+0x24e>
    33fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3404:	e8 66 0c 00 00       	call   406f <sbrk>
    3409:	8b 55 f4             	mov    -0xc(%ebp),%edx
    340c:	81 c2 00 10 00 00    	add    $0x1000,%edx
    3412:	39 d0                	cmp    %edx,%eax
    3414:	74 28                	je     343e <sbrktest+0x276>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3416:	a1 04 64 00 00       	mov    0x6404,%eax
    341b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    341e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3422:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3425:	89 54 24 08          	mov    %edx,0x8(%esp)
    3429:	c7 44 24 04 18 5a 00 	movl   $0x5a18,0x4(%esp)
    3430:	00 
    3431:	89 04 24             	mov    %eax,(%esp)
    3434:	e8 3e 0d 00 00       	call   4177 <printf>
    exit();
    3439:	e8 a9 0b 00 00       	call   3fe7 <exit>
  }
  if(*lastaddr == 99){
    343e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3441:	0f b6 00             	movzbl (%eax),%eax
    3444:	3c 63                	cmp    $0x63,%al
    3446:	75 1a                	jne    3462 <sbrktest+0x29a>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3448:	a1 04 64 00 00       	mov    0x6404,%eax
    344d:	c7 44 24 04 40 5a 00 	movl   $0x5a40,0x4(%esp)
    3454:	00 
    3455:	89 04 24             	mov    %eax,(%esp)
    3458:	e8 1a 0d 00 00       	call   4177 <printf>
    exit();
    345d:	e8 85 0b 00 00       	call   3fe7 <exit>
  }

  a = sbrk(0);
    3462:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3469:	e8 01 0c 00 00       	call   406f <sbrk>
    346e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    3471:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3474:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    347b:	e8 ef 0b 00 00       	call   406f <sbrk>
    3480:	29 c3                	sub    %eax,%ebx
    3482:	89 d8                	mov    %ebx,%eax
    3484:	89 04 24             	mov    %eax,(%esp)
    3487:	e8 e3 0b 00 00       	call   406f <sbrk>
    348c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    348f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3492:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3495:	74 28                	je     34bf <sbrktest+0x2f7>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3497:	a1 04 64 00 00       	mov    0x6404,%eax
    349c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    349f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    34a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    34a6:	89 54 24 08          	mov    %edx,0x8(%esp)
    34aa:	c7 44 24 04 70 5a 00 	movl   $0x5a70,0x4(%esp)
    34b1:	00 
    34b2:	89 04 24             	mov    %eax,(%esp)
    34b5:	e8 bd 0c 00 00       	call   4177 <printf>
    exit();
    34ba:	e8 28 0b 00 00       	call   3fe7 <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    34bf:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    34c6:	e9 8a 00 00 00       	jmp    3555 <sbrktest+0x38d>
    ppid = getpid();
    34cb:	e8 97 0b 00 00       	call   4067 <getpid>
    34d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    pid = fork(0,0);
    34d3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    34da:	00 
    34db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34e2:	e8 f8 0a 00 00       	call   3fdf <fork>
    34e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pid < 0){
    34ea:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    34ee:	79 1a                	jns    350a <sbrktest+0x342>
      printf(stdout, "fork failed\n");
    34f0:	a1 04 64 00 00       	mov    0x6404,%eax
    34f5:	c7 44 24 04 e5 45 00 	movl   $0x45e5,0x4(%esp)
    34fc:	00 
    34fd:	89 04 24             	mov    %eax,(%esp)
    3500:	e8 72 0c 00 00       	call   4177 <printf>
      exit();
    3505:	e8 dd 0a 00 00       	call   3fe7 <exit>
    }
    if(pid == 0){
    350a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    350e:	75 39                	jne    3549 <sbrktest+0x381>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3510:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3513:	0f b6 00             	movzbl (%eax),%eax
    3516:	0f be d0             	movsbl %al,%edx
    3519:	a1 04 64 00 00       	mov    0x6404,%eax
    351e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3522:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3525:	89 54 24 08          	mov    %edx,0x8(%esp)
    3529:	c7 44 24 04 91 5a 00 	movl   $0x5a91,0x4(%esp)
    3530:	00 
    3531:	89 04 24             	mov    %eax,(%esp)
    3534:	e8 3e 0c 00 00       	call   4177 <printf>
      kill(ppid);
    3539:	8b 45 d0             	mov    -0x30(%ebp),%eax
    353c:	89 04 24             	mov    %eax,(%esp)
    353f:	e8 d3 0a 00 00       	call   4017 <kill>
      exit();
    3544:	e8 9e 0a 00 00       	call   3fe7 <exit>
    }
    wait();
    3549:	e8 a1 0a 00 00       	call   3fef <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    354e:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    3555:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    355c:	0f 86 69 ff ff ff    	jbe    34cb <sbrktest+0x303>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    3562:	8d 45 c8             	lea    -0x38(%ebp),%eax
    3565:	89 04 24             	mov    %eax,(%esp)
    3568:	e8 8a 0a 00 00       	call   3ff7 <pipe>
    356d:	85 c0                	test   %eax,%eax
    356f:	74 19                	je     358a <sbrktest+0x3c2>
    printf(1, "pipe() failed\n");
    3571:	c7 44 24 04 b6 49 00 	movl   $0x49b6,0x4(%esp)
    3578:	00 
    3579:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3580:	e8 f2 0b 00 00       	call   4177 <printf>
    exit();
    3585:	e8 5d 0a 00 00       	call   3fe7 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    358a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3591:	e9 96 00 00 00       	jmp    362c <sbrktest+0x464>
    if((pids[i] = fork(0,0)) == 0){
    3596:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    359d:	00 
    359e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35a5:	e8 35 0a 00 00       	call   3fdf <fork>
    35aa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    35ad:	89 44 95 a0          	mov    %eax,-0x60(%ebp,%edx,4)
    35b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35b4:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    35b8:	85 c0                	test   %eax,%eax
    35ba:	75 46                	jne    3602 <sbrktest+0x43a>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    35bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35c3:	e8 a7 0a 00 00       	call   406f <sbrk>
    35c8:	ba 00 00 40 06       	mov    $0x6400000,%edx
    35cd:	29 c2                	sub    %eax,%edx
    35cf:	89 d0                	mov    %edx,%eax
    35d1:	89 04 24             	mov    %eax,(%esp)
    35d4:	e8 96 0a 00 00       	call   406f <sbrk>
      write(fds[1], "x", 1);
    35d9:	8b 45 cc             	mov    -0x34(%ebp),%eax
    35dc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    35e3:	00 
    35e4:	c7 44 24 04 1b 4a 00 	movl   $0x4a1b,0x4(%esp)
    35eb:	00 
    35ec:	89 04 24             	mov    %eax,(%esp)
    35ef:	e8 13 0a 00 00       	call   4007 <write>
      // sit around until killed
      for(;;) sleep(1000);
    35f4:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    35fb:	e8 77 0a 00 00       	call   4077 <sleep>
    3600:	eb f2                	jmp    35f4 <sbrktest+0x42c>
    }
    if(pids[i] != -1)
    3602:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3605:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3609:	83 f8 ff             	cmp    $0xffffffff,%eax
    360c:	74 1a                	je     3628 <sbrktest+0x460>
      read(fds[0], &scratch, 1);
    360e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3611:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3618:	00 
    3619:	8d 55 9f             	lea    -0x61(%ebp),%edx
    361c:	89 54 24 04          	mov    %edx,0x4(%esp)
    3620:	89 04 24             	mov    %eax,(%esp)
    3623:	e8 d7 09 00 00       	call   3fff <read>
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3628:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    362c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    362f:	83 f8 09             	cmp    $0x9,%eax
    3632:	0f 86 5e ff ff ff    	jbe    3596 <sbrktest+0x3ce>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3638:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    363f:	e8 2b 0a 00 00       	call   406f <sbrk>
    3644:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3647:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    364e:	eb 26                	jmp    3676 <sbrktest+0x4ae>
    if(pids[i] == -1)
    3650:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3653:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3657:	83 f8 ff             	cmp    $0xffffffff,%eax
    365a:	75 02                	jne    365e <sbrktest+0x496>
      continue;
    365c:	eb 14                	jmp    3672 <sbrktest+0x4aa>
    kill(pids[i]);
    365e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3661:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3665:	89 04 24             	mov    %eax,(%esp)
    3668:	e8 aa 09 00 00       	call   4017 <kill>
    wait();
    366d:	e8 7d 09 00 00       	call   3fef <wait>
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3672:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3676:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3679:	83 f8 09             	cmp    $0x9,%eax
    367c:	76 d2                	jbe    3650 <sbrktest+0x488>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    367e:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3682:	75 1a                	jne    369e <sbrktest+0x4d6>
    printf(stdout, "failed sbrk leaked memory\n");
    3684:	a1 04 64 00 00       	mov    0x6404,%eax
    3689:	c7 44 24 04 aa 5a 00 	movl   $0x5aaa,0x4(%esp)
    3690:	00 
    3691:	89 04 24             	mov    %eax,(%esp)
    3694:	e8 de 0a 00 00       	call   4177 <printf>
    exit();
    3699:	e8 49 09 00 00       	call   3fe7 <exit>
  }

  if(sbrk(0) > oldbrk)
    369e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36a5:	e8 c5 09 00 00       	call   406f <sbrk>
    36aa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    36ad:	76 1b                	jbe    36ca <sbrktest+0x502>
    sbrk(-(sbrk(0) - oldbrk));
    36af:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    36b2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36b9:	e8 b1 09 00 00       	call   406f <sbrk>
    36be:	29 c3                	sub    %eax,%ebx
    36c0:	89 d8                	mov    %ebx,%eax
    36c2:	89 04 24             	mov    %eax,(%esp)
    36c5:	e8 a5 09 00 00       	call   406f <sbrk>

  printf(stdout, "sbrk test OK\n");
    36ca:	a1 04 64 00 00       	mov    0x6404,%eax
    36cf:	c7 44 24 04 c5 5a 00 	movl   $0x5ac5,0x4(%esp)
    36d6:	00 
    36d7:	89 04 24             	mov    %eax,(%esp)
    36da:	e8 98 0a 00 00       	call   4177 <printf>
}
    36df:	81 c4 84 00 00 00    	add    $0x84,%esp
    36e5:	5b                   	pop    %ebx
    36e6:	5d                   	pop    %ebp
    36e7:	c3                   	ret    

000036e8 <validateint>:

void
validateint(int *p)
{
    36e8:	55                   	push   %ebp
    36e9:	89 e5                	mov    %esp,%ebp
    36eb:	53                   	push   %ebx
    36ec:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    36ef:	b8 0d 00 00 00       	mov    $0xd,%eax
    36f4:	8b 55 08             	mov    0x8(%ebp),%edx
    36f7:	89 d1                	mov    %edx,%ecx
    36f9:	89 e3                	mov    %esp,%ebx
    36fb:	89 cc                	mov    %ecx,%esp
    36fd:	cd 40                	int    $0x40
    36ff:	89 dc                	mov    %ebx,%esp
    3701:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3704:	83 c4 10             	add    $0x10,%esp
    3707:	5b                   	pop    %ebx
    3708:	5d                   	pop    %ebp
    3709:	c3                   	ret    

0000370a <validatetest>:

void
validatetest(void)
{
    370a:	55                   	push   %ebp
    370b:	89 e5                	mov    %esp,%ebp
    370d:	83 ec 28             	sub    $0x28,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3710:	a1 04 64 00 00       	mov    0x6404,%eax
    3715:	c7 44 24 04 d3 5a 00 	movl   $0x5ad3,0x4(%esp)
    371c:	00 
    371d:	89 04 24             	mov    %eax,(%esp)
    3720:	e8 52 0a 00 00       	call   4177 <printf>
  hi = 1100*1024;
    3725:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    372c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3733:	e9 8e 00 00 00       	jmp    37c6 <validatetest+0xbc>
    if((pid = fork(0,0)) == 0){
    3738:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    373f:	00 
    3740:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3747:	e8 93 08 00 00       	call   3fdf <fork>
    374c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    374f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3753:	75 10                	jne    3765 <validatetest+0x5b>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    3755:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3758:	89 04 24             	mov    %eax,(%esp)
    375b:	e8 88 ff ff ff       	call   36e8 <validateint>
      exit();
    3760:	e8 82 08 00 00       	call   3fe7 <exit>
    }
    sleep(0);
    3765:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    376c:	e8 06 09 00 00       	call   4077 <sleep>
    sleep(0);
    3771:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3778:	e8 fa 08 00 00       	call   4077 <sleep>
    kill(pid);
    377d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3780:	89 04 24             	mov    %eax,(%esp)
    3783:	e8 8f 08 00 00       	call   4017 <kill>
    wait();
    3788:	e8 62 08 00 00       	call   3fef <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    378d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3790:	89 44 24 04          	mov    %eax,0x4(%esp)
    3794:	c7 04 24 e2 5a 00 00 	movl   $0x5ae2,(%esp)
    379b:	e8 a7 08 00 00       	call   4047 <link>
    37a0:	83 f8 ff             	cmp    $0xffffffff,%eax
    37a3:	74 1a                	je     37bf <validatetest+0xb5>
      printf(stdout, "link should not succeed\n");
    37a5:	a1 04 64 00 00       	mov    0x6404,%eax
    37aa:	c7 44 24 04 ed 5a 00 	movl   $0x5aed,0x4(%esp)
    37b1:	00 
    37b2:	89 04 24             	mov    %eax,(%esp)
    37b5:	e8 bd 09 00 00       	call   4177 <printf>
      exit();
    37ba:	e8 28 08 00 00       	call   3fe7 <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    37bf:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    37c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    37c9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    37cc:	0f 83 66 ff ff ff    	jae    3738 <validatetest+0x2e>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    37d2:	a1 04 64 00 00       	mov    0x6404,%eax
    37d7:	c7 44 24 04 06 5b 00 	movl   $0x5b06,0x4(%esp)
    37de:	00 
    37df:	89 04 24             	mov    %eax,(%esp)
    37e2:	e8 90 09 00 00       	call   4177 <printf>
}
    37e7:	c9                   	leave  
    37e8:	c3                   	ret    

000037e9 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    37e9:	55                   	push   %ebp
    37ea:	89 e5                	mov    %esp,%ebp
    37ec:	83 ec 28             	sub    $0x28,%esp
  int i;

  printf(stdout, "bss test\n");
    37ef:	a1 04 64 00 00       	mov    0x6404,%eax
    37f4:	c7 44 24 04 13 5b 00 	movl   $0x5b13,0x4(%esp)
    37fb:	00 
    37fc:	89 04 24             	mov    %eax,(%esp)
    37ff:	e8 73 09 00 00       	call   4177 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    3804:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    380b:	eb 2d                	jmp    383a <bsstest+0x51>
    if(uninit[i] != '\0'){
    380d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3810:	05 c0 64 00 00       	add    $0x64c0,%eax
    3815:	0f b6 00             	movzbl (%eax),%eax
    3818:	84 c0                	test   %al,%al
    381a:	74 1a                	je     3836 <bsstest+0x4d>
      printf(stdout, "bss test failed\n");
    381c:	a1 04 64 00 00       	mov    0x6404,%eax
    3821:	c7 44 24 04 1d 5b 00 	movl   $0x5b1d,0x4(%esp)
    3828:	00 
    3829:	89 04 24             	mov    %eax,(%esp)
    382c:	e8 46 09 00 00       	call   4177 <printf>
      exit();
    3831:	e8 b1 07 00 00       	call   3fe7 <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3836:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    383a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    383d:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    3842:	76 c9                	jbe    380d <bsstest+0x24>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    3844:	a1 04 64 00 00       	mov    0x6404,%eax
    3849:	c7 44 24 04 2e 5b 00 	movl   $0x5b2e,0x4(%esp)
    3850:	00 
    3851:	89 04 24             	mov    %eax,(%esp)
    3854:	e8 1e 09 00 00       	call   4177 <printf>
}
    3859:	c9                   	leave  
    385a:	c3                   	ret    

0000385b <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    385b:	55                   	push   %ebp
    385c:	89 e5                	mov    %esp,%ebp
    385e:	83 ec 28             	sub    $0x28,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3861:	c7 04 24 3b 5b 00 00 	movl   $0x5b3b,(%esp)
    3868:	e8 ca 07 00 00       	call   4037 <unlink>
  pid = fork(0,0);
    386d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3874:	00 
    3875:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    387c:	e8 5e 07 00 00       	call   3fdf <fork>
    3881:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    3884:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3888:	0f 85 90 00 00 00    	jne    391e <bigargtest+0xc3>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    388e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3895:	eb 12                	jmp    38a9 <bigargtest+0x4e>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3897:	8b 45 f4             	mov    -0xc(%ebp),%eax
    389a:	c7 04 85 20 64 00 00 	movl   $0x5b48,0x6420(,%eax,4)
    38a1:	48 5b 00 00 
  unlink("bigarg-ok");
  pid = fork(0,0);
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    38a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    38a9:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    38ad:	7e e8                	jle    3897 <bigargtest+0x3c>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    38af:	c7 05 9c 64 00 00 00 	movl   $0x0,0x649c
    38b6:	00 00 00 
    printf(stdout, "bigarg test\n");
    38b9:	a1 04 64 00 00       	mov    0x6404,%eax
    38be:	c7 44 24 04 25 5c 00 	movl   $0x5c25,0x4(%esp)
    38c5:	00 
    38c6:	89 04 24             	mov    %eax,(%esp)
    38c9:	e8 a9 08 00 00       	call   4177 <printf>
    exec("echo", args);
    38ce:	c7 44 24 04 20 64 00 	movl   $0x6420,0x4(%esp)
    38d5:	00 
    38d6:	c7 04 24 44 45 00 00 	movl   $0x4544,(%esp)
    38dd:	e8 3d 07 00 00       	call   401f <exec>
    printf(stdout, "bigarg test ok\n");
    38e2:	a1 04 64 00 00       	mov    0x6404,%eax
    38e7:	c7 44 24 04 32 5c 00 	movl   $0x5c32,0x4(%esp)
    38ee:	00 
    38ef:	89 04 24             	mov    %eax,(%esp)
    38f2:	e8 80 08 00 00       	call   4177 <printf>
    fd = open("bigarg-ok", O_CREATE);
    38f7:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    38fe:	00 
    38ff:	c7 04 24 3b 5b 00 00 	movl   $0x5b3b,(%esp)
    3906:	e8 1c 07 00 00       	call   4027 <open>
    390b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    390e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3911:	89 04 24             	mov    %eax,(%esp)
    3914:	e8 f6 06 00 00       	call   400f <close>
    exit();
    3919:	e8 c9 06 00 00       	call   3fe7 <exit>
  } else if(pid < 0){
    391e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3922:	79 1a                	jns    393e <bigargtest+0xe3>
    printf(stdout, "bigargtest: fork failed\n");
    3924:	a1 04 64 00 00       	mov    0x6404,%eax
    3929:	c7 44 24 04 42 5c 00 	movl   $0x5c42,0x4(%esp)
    3930:	00 
    3931:	89 04 24             	mov    %eax,(%esp)
    3934:	e8 3e 08 00 00       	call   4177 <printf>
    exit();
    3939:	e8 a9 06 00 00       	call   3fe7 <exit>
  }
  wait();
    393e:	e8 ac 06 00 00       	call   3fef <wait>
  fd = open("bigarg-ok", 0);
    3943:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    394a:	00 
    394b:	c7 04 24 3b 5b 00 00 	movl   $0x5b3b,(%esp)
    3952:	e8 d0 06 00 00       	call   4027 <open>
    3957:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    395a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    395e:	79 1a                	jns    397a <bigargtest+0x11f>
    printf(stdout, "bigarg test failed!\n");
    3960:	a1 04 64 00 00       	mov    0x6404,%eax
    3965:	c7 44 24 04 5b 5c 00 	movl   $0x5c5b,0x4(%esp)
    396c:	00 
    396d:	89 04 24             	mov    %eax,(%esp)
    3970:	e8 02 08 00 00       	call   4177 <printf>
    exit();
    3975:	e8 6d 06 00 00       	call   3fe7 <exit>
  }
  close(fd);
    397a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    397d:	89 04 24             	mov    %eax,(%esp)
    3980:	e8 8a 06 00 00       	call   400f <close>
  unlink("bigarg-ok");
    3985:	c7 04 24 3b 5b 00 00 	movl   $0x5b3b,(%esp)
    398c:	e8 a6 06 00 00       	call   4037 <unlink>
}
    3991:	c9                   	leave  
    3992:	c3                   	ret    

00003993 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3993:	55                   	push   %ebp
    3994:	89 e5                	mov    %esp,%ebp
    3996:	53                   	push   %ebx
    3997:	83 ec 74             	sub    $0x74,%esp
  int nfiles;
  int fsblocks = 0;
    399a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    39a1:	c7 44 24 04 70 5c 00 	movl   $0x5c70,0x4(%esp)
    39a8:	00 
    39a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    39b0:	e8 c2 07 00 00       	call   4177 <printf>

  for(nfiles = 0; ; nfiles++){
    39b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    39bc:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    39c0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    39c3:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    39c8:	89 c8                	mov    %ecx,%eax
    39ca:	f7 ea                	imul   %edx
    39cc:	c1 fa 06             	sar    $0x6,%edx
    39cf:	89 c8                	mov    %ecx,%eax
    39d1:	c1 f8 1f             	sar    $0x1f,%eax
    39d4:	29 c2                	sub    %eax,%edx
    39d6:	89 d0                	mov    %edx,%eax
    39d8:	83 c0 30             	add    $0x30,%eax
    39db:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    39de:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    39e1:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    39e6:	89 d8                	mov    %ebx,%eax
    39e8:	f7 ea                	imul   %edx
    39ea:	c1 fa 06             	sar    $0x6,%edx
    39ed:	89 d8                	mov    %ebx,%eax
    39ef:	c1 f8 1f             	sar    $0x1f,%eax
    39f2:	89 d1                	mov    %edx,%ecx
    39f4:	29 c1                	sub    %eax,%ecx
    39f6:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    39fc:	29 c3                	sub    %eax,%ebx
    39fe:	89 d9                	mov    %ebx,%ecx
    3a00:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3a05:	89 c8                	mov    %ecx,%eax
    3a07:	f7 ea                	imul   %edx
    3a09:	c1 fa 05             	sar    $0x5,%edx
    3a0c:	89 c8                	mov    %ecx,%eax
    3a0e:	c1 f8 1f             	sar    $0x1f,%eax
    3a11:	29 c2                	sub    %eax,%edx
    3a13:	89 d0                	mov    %edx,%eax
    3a15:	83 c0 30             	add    $0x30,%eax
    3a18:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3a1b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3a1e:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3a23:	89 d8                	mov    %ebx,%eax
    3a25:	f7 ea                	imul   %edx
    3a27:	c1 fa 05             	sar    $0x5,%edx
    3a2a:	89 d8                	mov    %ebx,%eax
    3a2c:	c1 f8 1f             	sar    $0x1f,%eax
    3a2f:	89 d1                	mov    %edx,%ecx
    3a31:	29 c1                	sub    %eax,%ecx
    3a33:	6b c1 64             	imul   $0x64,%ecx,%eax
    3a36:	29 c3                	sub    %eax,%ebx
    3a38:	89 d9                	mov    %ebx,%ecx
    3a3a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3a3f:	89 c8                	mov    %ecx,%eax
    3a41:	f7 ea                	imul   %edx
    3a43:	c1 fa 02             	sar    $0x2,%edx
    3a46:	89 c8                	mov    %ecx,%eax
    3a48:	c1 f8 1f             	sar    $0x1f,%eax
    3a4b:	29 c2                	sub    %eax,%edx
    3a4d:	89 d0                	mov    %edx,%eax
    3a4f:	83 c0 30             	add    $0x30,%eax
    3a52:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3a55:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3a58:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3a5d:	89 c8                	mov    %ecx,%eax
    3a5f:	f7 ea                	imul   %edx
    3a61:	c1 fa 02             	sar    $0x2,%edx
    3a64:	89 c8                	mov    %ecx,%eax
    3a66:	c1 f8 1f             	sar    $0x1f,%eax
    3a69:	29 c2                	sub    %eax,%edx
    3a6b:	89 d0                	mov    %edx,%eax
    3a6d:	c1 e0 02             	shl    $0x2,%eax
    3a70:	01 d0                	add    %edx,%eax
    3a72:	01 c0                	add    %eax,%eax
    3a74:	29 c1                	sub    %eax,%ecx
    3a76:	89 ca                	mov    %ecx,%edx
    3a78:	89 d0                	mov    %edx,%eax
    3a7a:	83 c0 30             	add    $0x30,%eax
    3a7d:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3a80:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    3a84:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3a87:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a8b:	c7 44 24 04 7d 5c 00 	movl   $0x5c7d,0x4(%esp)
    3a92:	00 
    3a93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a9a:	e8 d8 06 00 00       	call   4177 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3a9f:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3aa6:	00 
    3aa7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3aaa:	89 04 24             	mov    %eax,(%esp)
    3aad:	e8 75 05 00 00       	call   4027 <open>
    3ab2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    3ab5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3ab9:	79 1d                	jns    3ad8 <fsfull+0x145>
      printf(1, "open %s failed\n", name);
    3abb:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3abe:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ac2:	c7 44 24 04 89 5c 00 	movl   $0x5c89,0x4(%esp)
    3ac9:	00 
    3aca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3ad1:	e8 a1 06 00 00       	call   4177 <printf>
      break;
    3ad6:	eb 74                	jmp    3b4c <fsfull+0x1b9>
    }
    int total = 0;
    3ad8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    3adf:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3ae6:	00 
    3ae7:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    3aee:	00 
    3aef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3af2:	89 04 24             	mov    %eax,(%esp)
    3af5:	e8 0d 05 00 00       	call   4007 <write>
    3afa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    3afd:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    3b04:	7f 2f                	jg     3b35 <fsfull+0x1a2>
        break;
    3b06:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3b07:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b0a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b0e:	c7 44 24 04 99 5c 00 	movl   $0x5c99,0x4(%esp)
    3b15:	00 
    3b16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3b1d:	e8 55 06 00 00       	call   4177 <printf>
    close(fd);
    3b22:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3b25:	89 04 24             	mov    %eax,(%esp)
    3b28:	e8 e2 04 00 00       	call   400f <close>
    if(total == 0)
    3b2d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3b31:	75 10                	jne    3b43 <fsfull+0x1b0>
    3b33:	eb 0c                	jmp    3b41 <fsfull+0x1ae>
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3b35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3b38:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    3b3b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    3b3f:	eb 9e                	jmp    3adf <fsfull+0x14c>
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
    3b41:	eb 09                	jmp    3b4c <fsfull+0x1b9>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3b43:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3b47:	e9 70 fe ff ff       	jmp    39bc <fsfull+0x29>

  while(nfiles >= 0){
    3b4c:	e9 d7 00 00 00       	jmp    3c28 <fsfull+0x295>
    char name[64];
    name[0] = 'f';
    3b51:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3b55:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3b58:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3b5d:	89 c8                	mov    %ecx,%eax
    3b5f:	f7 ea                	imul   %edx
    3b61:	c1 fa 06             	sar    $0x6,%edx
    3b64:	89 c8                	mov    %ecx,%eax
    3b66:	c1 f8 1f             	sar    $0x1f,%eax
    3b69:	29 c2                	sub    %eax,%edx
    3b6b:	89 d0                	mov    %edx,%eax
    3b6d:	83 c0 30             	add    $0x30,%eax
    3b70:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3b73:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3b76:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3b7b:	89 d8                	mov    %ebx,%eax
    3b7d:	f7 ea                	imul   %edx
    3b7f:	c1 fa 06             	sar    $0x6,%edx
    3b82:	89 d8                	mov    %ebx,%eax
    3b84:	c1 f8 1f             	sar    $0x1f,%eax
    3b87:	89 d1                	mov    %edx,%ecx
    3b89:	29 c1                	sub    %eax,%ecx
    3b8b:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3b91:	29 c3                	sub    %eax,%ebx
    3b93:	89 d9                	mov    %ebx,%ecx
    3b95:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3b9a:	89 c8                	mov    %ecx,%eax
    3b9c:	f7 ea                	imul   %edx
    3b9e:	c1 fa 05             	sar    $0x5,%edx
    3ba1:	89 c8                	mov    %ecx,%eax
    3ba3:	c1 f8 1f             	sar    $0x1f,%eax
    3ba6:	29 c2                	sub    %eax,%edx
    3ba8:	89 d0                	mov    %edx,%eax
    3baa:	83 c0 30             	add    $0x30,%eax
    3bad:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3bb0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3bb3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3bb8:	89 d8                	mov    %ebx,%eax
    3bba:	f7 ea                	imul   %edx
    3bbc:	c1 fa 05             	sar    $0x5,%edx
    3bbf:	89 d8                	mov    %ebx,%eax
    3bc1:	c1 f8 1f             	sar    $0x1f,%eax
    3bc4:	89 d1                	mov    %edx,%ecx
    3bc6:	29 c1                	sub    %eax,%ecx
    3bc8:	6b c1 64             	imul   $0x64,%ecx,%eax
    3bcb:	29 c3                	sub    %eax,%ebx
    3bcd:	89 d9                	mov    %ebx,%ecx
    3bcf:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3bd4:	89 c8                	mov    %ecx,%eax
    3bd6:	f7 ea                	imul   %edx
    3bd8:	c1 fa 02             	sar    $0x2,%edx
    3bdb:	89 c8                	mov    %ecx,%eax
    3bdd:	c1 f8 1f             	sar    $0x1f,%eax
    3be0:	29 c2                	sub    %eax,%edx
    3be2:	89 d0                	mov    %edx,%eax
    3be4:	83 c0 30             	add    $0x30,%eax
    3be7:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3bea:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3bed:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3bf2:	89 c8                	mov    %ecx,%eax
    3bf4:	f7 ea                	imul   %edx
    3bf6:	c1 fa 02             	sar    $0x2,%edx
    3bf9:	89 c8                	mov    %ecx,%eax
    3bfb:	c1 f8 1f             	sar    $0x1f,%eax
    3bfe:	29 c2                	sub    %eax,%edx
    3c00:	89 d0                	mov    %edx,%eax
    3c02:	c1 e0 02             	shl    $0x2,%eax
    3c05:	01 d0                	add    %edx,%eax
    3c07:	01 c0                	add    %eax,%eax
    3c09:	29 c1                	sub    %eax,%ecx
    3c0b:	89 ca                	mov    %ecx,%edx
    3c0d:	89 d0                	mov    %edx,%eax
    3c0f:	83 c0 30             	add    $0x30,%eax
    3c12:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3c15:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    3c19:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3c1c:	89 04 24             	mov    %eax,(%esp)
    3c1f:	e8 13 04 00 00       	call   4037 <unlink>
    nfiles--;
    3c24:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3c28:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3c2c:	0f 89 1f ff ff ff    	jns    3b51 <fsfull+0x1be>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3c32:	c7 44 24 04 a9 5c 00 	movl   $0x5ca9,0x4(%esp)
    3c39:	00 
    3c3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c41:	e8 31 05 00 00       	call   4177 <printf>
}
    3c46:	83 c4 74             	add    $0x74,%esp
    3c49:	5b                   	pop    %ebx
    3c4a:	5d                   	pop    %ebp
    3c4b:	c3                   	ret    

00003c4c <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    3c4c:	55                   	push   %ebp
    3c4d:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    3c4f:	a1 08 64 00 00       	mov    0x6408,%eax
    3c54:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    3c5a:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3c5f:	a3 08 64 00 00       	mov    %eax,0x6408
  return randstate;
    3c64:	a1 08 64 00 00       	mov    0x6408,%eax
}
    3c69:	5d                   	pop    %ebp
    3c6a:	c3                   	ret    

00003c6b <main>:

int
main(int argc, char *argv[])
{
    3c6b:	55                   	push   %ebp
    3c6c:	89 e5                	mov    %esp,%ebp
    3c6e:	83 e4 f0             	and    $0xfffffff0,%esp
    3c71:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
    3c74:	c7 44 24 04 bf 5c 00 	movl   $0x5cbf,0x4(%esp)
    3c7b:	00 
    3c7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c83:	e8 ef 04 00 00       	call   4177 <printf>

  if(open("usertests.ran", 0) >= 0){
    3c88:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3c8f:	00 
    3c90:	c7 04 24 d3 5c 00 00 	movl   $0x5cd3,(%esp)
    3c97:	e8 8b 03 00 00       	call   4027 <open>
    3c9c:	85 c0                	test   %eax,%eax
    3c9e:	78 19                	js     3cb9 <main+0x4e>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3ca0:	c7 44 24 04 e4 5c 00 	movl   $0x5ce4,0x4(%esp)
    3ca7:	00 
    3ca8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3caf:	e8 c3 04 00 00       	call   4177 <printf>
    exit();
    3cb4:	e8 2e 03 00 00       	call   3fe7 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    3cb9:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3cc0:	00 
    3cc1:	c7 04 24 d3 5c 00 00 	movl   $0x5cd3,(%esp)
    3cc8:	e8 5a 03 00 00       	call   4027 <open>
    3ccd:	89 04 24             	mov    %eax,(%esp)
    3cd0:	e8 3a 03 00 00       	call   400f <close>

  createdelete();
    3cd5:	e8 3e d6 ff ff       	call   1318 <createdelete>
  linkunlink();
    3cda:	e8 af e0 ff ff       	call   1d8e <linkunlink>
  concreate();
    3cdf:	e8 d9 dc ff ff       	call   19bd <concreate>
  fourfiles();
    3ce4:	e8 b8 d3 ff ff       	call   10a1 <fourfiles>
  sharedfd();
    3ce9:	e8 a6 d1 ff ff       	call   e94 <sharedfd>

  bigargtest();
    3cee:	e8 68 fb ff ff       	call   385b <bigargtest>
  bigwrite();
    3cf3:	e8 86 ea ff ff       	call   277e <bigwrite>
  bigargtest();
    3cf8:	e8 5e fb ff ff       	call   385b <bigargtest>
  bsstest();
    3cfd:	e8 e7 fa ff ff       	call   37e9 <bsstest>
  sbrktest();
    3d02:	e8 c1 f4 ff ff       	call   31c8 <sbrktest>
  validatetest();
    3d07:	e8 fe f9 ff ff       	call   370a <validatetest>

  opentest();
    3d0c:	e8 d4 c5 ff ff       	call   2e5 <opentest>
  writetest();
    3d11:	e8 7a c6 ff ff       	call   390 <writetest>
  writetest1();
    3d16:	e8 8a c8 ff ff       	call   5a5 <writetest1>
  createtest();
    3d1b:	e8 90 ca ff ff       	call   7b0 <createtest>

  openiputtest();
    3d20:	e8 b0 c4 ff ff       	call   1d5 <openiputtest>
  exitiputtest();
    3d25:	e8 b0 c3 ff ff       	call   da <exitiputtest>
  iputtest();
    3d2a:	e8 d1 c2 ff ff       	call   0 <iputtest>

  mem();
    3d2f:	e8 6c d0 ff ff       	call   da0 <mem>
  pipe1();
    3d34:	e8 58 cc ff ff       	call   991 <pipe1>
  preempt();
    3d39:	e8 4f ce ff ff       	call   b8d <preempt>
  exitwait();
    3d3e:	e8 d0 cf ff ff       	call   d13 <exitwait>

  rmdot();
    3d43:	e8 bf ee ff ff       	call   2c07 <rmdot>
  fourteen();
    3d48:	e8 64 ed ff ff       	call   2ab1 <fourteen>
  bigfile();
    3d4d:	e8 34 eb ff ff       	call   2886 <bigfile>
  subdir();
    3d52:	e8 e1 e2 ff ff       	call   2038 <subdir>
  linktest();
    3d57:	e8 18 da ff ff       	call   1774 <linktest>
  unlinkread();
    3d5c:	e8 3e d8 ff ff       	call   159f <unlinkread>
  dirfile();
    3d61:	e8 19 f0 ff ff       	call   2d7f <dirfile>
  iref();
    3d66:	e8 56 f2 ff ff       	call   2fc1 <iref>
  forktest();
    3d6b:	e8 75 f3 ff ff       	call   30e5 <forktest>
  bigdir(); // slow
    3d70:	e8 56 e1 ff ff       	call   1ecb <bigdir>
  exectest();
    3d75:	e8 c8 cb ff ff       	call   942 <exectest>

  exit();
    3d7a:	e8 68 02 00 00       	call   3fe7 <exit>

00003d7f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3d7f:	55                   	push   %ebp
    3d80:	89 e5                	mov    %esp,%ebp
    3d82:	57                   	push   %edi
    3d83:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3d84:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3d87:	8b 55 10             	mov    0x10(%ebp),%edx
    3d8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d8d:	89 cb                	mov    %ecx,%ebx
    3d8f:	89 df                	mov    %ebx,%edi
    3d91:	89 d1                	mov    %edx,%ecx
    3d93:	fc                   	cld    
    3d94:	f3 aa                	rep stos %al,%es:(%edi)
    3d96:	89 ca                	mov    %ecx,%edx
    3d98:	89 fb                	mov    %edi,%ebx
    3d9a:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3d9d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3da0:	5b                   	pop    %ebx
    3da1:	5f                   	pop    %edi
    3da2:	5d                   	pop    %ebp
    3da3:	c3                   	ret    

00003da4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3da4:	55                   	push   %ebp
    3da5:	89 e5                	mov    %esp,%ebp
    3da7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3daa:	8b 45 08             	mov    0x8(%ebp),%eax
    3dad:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3db0:	90                   	nop
    3db1:	8b 45 08             	mov    0x8(%ebp),%eax
    3db4:	8d 50 01             	lea    0x1(%eax),%edx
    3db7:	89 55 08             	mov    %edx,0x8(%ebp)
    3dba:	8b 55 0c             	mov    0xc(%ebp),%edx
    3dbd:	8d 4a 01             	lea    0x1(%edx),%ecx
    3dc0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3dc3:	0f b6 12             	movzbl (%edx),%edx
    3dc6:	88 10                	mov    %dl,(%eax)
    3dc8:	0f b6 00             	movzbl (%eax),%eax
    3dcb:	84 c0                	test   %al,%al
    3dcd:	75 e2                	jne    3db1 <strcpy+0xd>
    ;
  return os;
    3dcf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3dd2:	c9                   	leave  
    3dd3:	c3                   	ret    

00003dd4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3dd4:	55                   	push   %ebp
    3dd5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3dd7:	eb 08                	jmp    3de1 <strcmp+0xd>
    p++, q++;
    3dd9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3ddd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3de1:	8b 45 08             	mov    0x8(%ebp),%eax
    3de4:	0f b6 00             	movzbl (%eax),%eax
    3de7:	84 c0                	test   %al,%al
    3de9:	74 10                	je     3dfb <strcmp+0x27>
    3deb:	8b 45 08             	mov    0x8(%ebp),%eax
    3dee:	0f b6 10             	movzbl (%eax),%edx
    3df1:	8b 45 0c             	mov    0xc(%ebp),%eax
    3df4:	0f b6 00             	movzbl (%eax),%eax
    3df7:	38 c2                	cmp    %al,%dl
    3df9:	74 de                	je     3dd9 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3dfb:	8b 45 08             	mov    0x8(%ebp),%eax
    3dfe:	0f b6 00             	movzbl (%eax),%eax
    3e01:	0f b6 d0             	movzbl %al,%edx
    3e04:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e07:	0f b6 00             	movzbl (%eax),%eax
    3e0a:	0f b6 c0             	movzbl %al,%eax
    3e0d:	29 c2                	sub    %eax,%edx
    3e0f:	89 d0                	mov    %edx,%eax
}
    3e11:	5d                   	pop    %ebp
    3e12:	c3                   	ret    

00003e13 <strlen>:

uint
strlen(char *s)
{
    3e13:	55                   	push   %ebp
    3e14:	89 e5                	mov    %esp,%ebp
    3e16:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3e19:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3e20:	eb 04                	jmp    3e26 <strlen+0x13>
    3e22:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3e26:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3e29:	8b 45 08             	mov    0x8(%ebp),%eax
    3e2c:	01 d0                	add    %edx,%eax
    3e2e:	0f b6 00             	movzbl (%eax),%eax
    3e31:	84 c0                	test   %al,%al
    3e33:	75 ed                	jne    3e22 <strlen+0xf>
    ;
  return n;
    3e35:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3e38:	c9                   	leave  
    3e39:	c3                   	ret    

00003e3a <memset>:

void*
memset(void *dst, int c, uint n)
{
    3e3a:	55                   	push   %ebp
    3e3b:	89 e5                	mov    %esp,%ebp
    3e3d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3e40:	8b 45 10             	mov    0x10(%ebp),%eax
    3e43:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e47:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e4a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e4e:	8b 45 08             	mov    0x8(%ebp),%eax
    3e51:	89 04 24             	mov    %eax,(%esp)
    3e54:	e8 26 ff ff ff       	call   3d7f <stosb>
  return dst;
    3e59:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3e5c:	c9                   	leave  
    3e5d:	c3                   	ret    

00003e5e <strchr>:

char*
strchr(const char *s, char c)
{
    3e5e:	55                   	push   %ebp
    3e5f:	89 e5                	mov    %esp,%ebp
    3e61:	83 ec 04             	sub    $0x4,%esp
    3e64:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e67:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3e6a:	eb 14                	jmp    3e80 <strchr+0x22>
    if(*s == c)
    3e6c:	8b 45 08             	mov    0x8(%ebp),%eax
    3e6f:	0f b6 00             	movzbl (%eax),%eax
    3e72:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3e75:	75 05                	jne    3e7c <strchr+0x1e>
      return (char*)s;
    3e77:	8b 45 08             	mov    0x8(%ebp),%eax
    3e7a:	eb 13                	jmp    3e8f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3e7c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3e80:	8b 45 08             	mov    0x8(%ebp),%eax
    3e83:	0f b6 00             	movzbl (%eax),%eax
    3e86:	84 c0                	test   %al,%al
    3e88:	75 e2                	jne    3e6c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3e8a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3e8f:	c9                   	leave  
    3e90:	c3                   	ret    

00003e91 <gets>:

char*
gets(char *buf, int max)
{
    3e91:	55                   	push   %ebp
    3e92:	89 e5                	mov    %esp,%ebp
    3e94:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3e97:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3e9e:	eb 4c                	jmp    3eec <gets+0x5b>
    cc = read(0, &c, 1);
    3ea0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3ea7:	00 
    3ea8:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3eab:	89 44 24 04          	mov    %eax,0x4(%esp)
    3eaf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3eb6:	e8 44 01 00 00       	call   3fff <read>
    3ebb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3ebe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3ec2:	7f 02                	jg     3ec6 <gets+0x35>
      break;
    3ec4:	eb 31                	jmp    3ef7 <gets+0x66>
    buf[i++] = c;
    3ec6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ec9:	8d 50 01             	lea    0x1(%eax),%edx
    3ecc:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3ecf:	89 c2                	mov    %eax,%edx
    3ed1:	8b 45 08             	mov    0x8(%ebp),%eax
    3ed4:	01 c2                	add    %eax,%edx
    3ed6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3eda:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3edc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3ee0:	3c 0a                	cmp    $0xa,%al
    3ee2:	74 13                	je     3ef7 <gets+0x66>
    3ee4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3ee8:	3c 0d                	cmp    $0xd,%al
    3eea:	74 0b                	je     3ef7 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3eec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3eef:	83 c0 01             	add    $0x1,%eax
    3ef2:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3ef5:	7c a9                	jl     3ea0 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3ef7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3efa:	8b 45 08             	mov    0x8(%ebp),%eax
    3efd:	01 d0                	add    %edx,%eax
    3eff:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3f02:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3f05:	c9                   	leave  
    3f06:	c3                   	ret    

00003f07 <stat>:

int
stat(char *n, struct stat *st)
{
    3f07:	55                   	push   %ebp
    3f08:	89 e5                	mov    %esp,%ebp
    3f0a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3f0d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3f14:	00 
    3f15:	8b 45 08             	mov    0x8(%ebp),%eax
    3f18:	89 04 24             	mov    %eax,(%esp)
    3f1b:	e8 07 01 00 00       	call   4027 <open>
    3f20:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3f23:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3f27:	79 07                	jns    3f30 <stat+0x29>
    return -1;
    3f29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3f2e:	eb 23                	jmp    3f53 <stat+0x4c>
  r = fstat(fd, st);
    3f30:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f33:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f37:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f3a:	89 04 24             	mov    %eax,(%esp)
    3f3d:	e8 fd 00 00 00       	call   403f <fstat>
    3f42:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3f45:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f48:	89 04 24             	mov    %eax,(%esp)
    3f4b:	e8 bf 00 00 00       	call   400f <close>
  return r;
    3f50:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3f53:	c9                   	leave  
    3f54:	c3                   	ret    

00003f55 <atoi>:

int
atoi(const char *s)
{
    3f55:	55                   	push   %ebp
    3f56:	89 e5                	mov    %esp,%ebp
    3f58:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3f5b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3f62:	eb 25                	jmp    3f89 <atoi+0x34>
    n = n*10 + *s++ - '0';
    3f64:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3f67:	89 d0                	mov    %edx,%eax
    3f69:	c1 e0 02             	shl    $0x2,%eax
    3f6c:	01 d0                	add    %edx,%eax
    3f6e:	01 c0                	add    %eax,%eax
    3f70:	89 c1                	mov    %eax,%ecx
    3f72:	8b 45 08             	mov    0x8(%ebp),%eax
    3f75:	8d 50 01             	lea    0x1(%eax),%edx
    3f78:	89 55 08             	mov    %edx,0x8(%ebp)
    3f7b:	0f b6 00             	movzbl (%eax),%eax
    3f7e:	0f be c0             	movsbl %al,%eax
    3f81:	01 c8                	add    %ecx,%eax
    3f83:	83 e8 30             	sub    $0x30,%eax
    3f86:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3f89:	8b 45 08             	mov    0x8(%ebp),%eax
    3f8c:	0f b6 00             	movzbl (%eax),%eax
    3f8f:	3c 2f                	cmp    $0x2f,%al
    3f91:	7e 0a                	jle    3f9d <atoi+0x48>
    3f93:	8b 45 08             	mov    0x8(%ebp),%eax
    3f96:	0f b6 00             	movzbl (%eax),%eax
    3f99:	3c 39                	cmp    $0x39,%al
    3f9b:	7e c7                	jle    3f64 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3f9d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3fa0:	c9                   	leave  
    3fa1:	c3                   	ret    

00003fa2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3fa2:	55                   	push   %ebp
    3fa3:	89 e5                	mov    %esp,%ebp
    3fa5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3fa8:	8b 45 08             	mov    0x8(%ebp),%eax
    3fab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3fae:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fb1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3fb4:	eb 17                	jmp    3fcd <memmove+0x2b>
    *dst++ = *src++;
    3fb6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fb9:	8d 50 01             	lea    0x1(%eax),%edx
    3fbc:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3fbf:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3fc2:	8d 4a 01             	lea    0x1(%edx),%ecx
    3fc5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3fc8:	0f b6 12             	movzbl (%edx),%edx
    3fcb:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3fcd:	8b 45 10             	mov    0x10(%ebp),%eax
    3fd0:	8d 50 ff             	lea    -0x1(%eax),%edx
    3fd3:	89 55 10             	mov    %edx,0x10(%ebp)
    3fd6:	85 c0                	test   %eax,%eax
    3fd8:	7f dc                	jg     3fb6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3fda:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3fdd:	c9                   	leave  
    3fde:	c3                   	ret    

00003fdf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3fdf:	b8 01 00 00 00       	mov    $0x1,%eax
    3fe4:	cd 40                	int    $0x40
    3fe6:	c3                   	ret    

00003fe7 <exit>:
SYSCALL(exit)
    3fe7:	b8 02 00 00 00       	mov    $0x2,%eax
    3fec:	cd 40                	int    $0x40
    3fee:	c3                   	ret    

00003fef <wait>:
SYSCALL(wait)
    3fef:	b8 03 00 00 00       	mov    $0x3,%eax
    3ff4:	cd 40                	int    $0x40
    3ff6:	c3                   	ret    

00003ff7 <pipe>:
SYSCALL(pipe)
    3ff7:	b8 04 00 00 00       	mov    $0x4,%eax
    3ffc:	cd 40                	int    $0x40
    3ffe:	c3                   	ret    

00003fff <read>:
SYSCALL(read)
    3fff:	b8 05 00 00 00       	mov    $0x5,%eax
    4004:	cd 40                	int    $0x40
    4006:	c3                   	ret    

00004007 <write>:
SYSCALL(write)
    4007:	b8 10 00 00 00       	mov    $0x10,%eax
    400c:	cd 40                	int    $0x40
    400e:	c3                   	ret    

0000400f <close>:
SYSCALL(close)
    400f:	b8 15 00 00 00       	mov    $0x15,%eax
    4014:	cd 40                	int    $0x40
    4016:	c3                   	ret    

00004017 <kill>:
SYSCALL(kill)
    4017:	b8 06 00 00 00       	mov    $0x6,%eax
    401c:	cd 40                	int    $0x40
    401e:	c3                   	ret    

0000401f <exec>:
SYSCALL(exec)
    401f:	b8 07 00 00 00       	mov    $0x7,%eax
    4024:	cd 40                	int    $0x40
    4026:	c3                   	ret    

00004027 <open>:
SYSCALL(open)
    4027:	b8 0f 00 00 00       	mov    $0xf,%eax
    402c:	cd 40                	int    $0x40
    402e:	c3                   	ret    

0000402f <mknod>:
SYSCALL(mknod)
    402f:	b8 11 00 00 00       	mov    $0x11,%eax
    4034:	cd 40                	int    $0x40
    4036:	c3                   	ret    

00004037 <unlink>:
SYSCALL(unlink)
    4037:	b8 12 00 00 00       	mov    $0x12,%eax
    403c:	cd 40                	int    $0x40
    403e:	c3                   	ret    

0000403f <fstat>:
SYSCALL(fstat)
    403f:	b8 08 00 00 00       	mov    $0x8,%eax
    4044:	cd 40                	int    $0x40
    4046:	c3                   	ret    

00004047 <link>:
SYSCALL(link)
    4047:	b8 13 00 00 00       	mov    $0x13,%eax
    404c:	cd 40                	int    $0x40
    404e:	c3                   	ret    

0000404f <mkdir>:
SYSCALL(mkdir)
    404f:	b8 14 00 00 00       	mov    $0x14,%eax
    4054:	cd 40                	int    $0x40
    4056:	c3                   	ret    

00004057 <chdir>:
SYSCALL(chdir)
    4057:	b8 09 00 00 00       	mov    $0x9,%eax
    405c:	cd 40                	int    $0x40
    405e:	c3                   	ret    

0000405f <dup>:
SYSCALL(dup)
    405f:	b8 0a 00 00 00       	mov    $0xa,%eax
    4064:	cd 40                	int    $0x40
    4066:	c3                   	ret    

00004067 <getpid>:
SYSCALL(getpid)
    4067:	b8 0b 00 00 00       	mov    $0xb,%eax
    406c:	cd 40                	int    $0x40
    406e:	c3                   	ret    

0000406f <sbrk>:
SYSCALL(sbrk)
    406f:	b8 0c 00 00 00       	mov    $0xc,%eax
    4074:	cd 40                	int    $0x40
    4076:	c3                   	ret    

00004077 <sleep>:
SYSCALL(sleep)
    4077:	b8 0d 00 00 00       	mov    $0xd,%eax
    407c:	cd 40                	int    $0x40
    407e:	c3                   	ret    

0000407f <uptime>:
SYSCALL(uptime)
    407f:	b8 0e 00 00 00       	mov    $0xe,%eax
    4084:	cd 40                	int    $0x40
    4086:	c3                   	ret    

00004087 <hello>:
SYSCALL(hello)
    4087:	b8 16 00 00 00       	mov    $0x16,%eax
    408c:	cd 40                	int    $0x40
    408e:	c3                   	ret    

0000408f <cps>:
SYSCALL(cps)
    408f:	b8 17 00 00 00       	mov    $0x17,%eax
    4094:	cd 40                	int    $0x40
    4096:	c3                   	ret    

00004097 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4097:	55                   	push   %ebp
    4098:	89 e5                	mov    %esp,%ebp
    409a:	83 ec 18             	sub    $0x18,%esp
    409d:	8b 45 0c             	mov    0xc(%ebp),%eax
    40a0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    40a3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    40aa:	00 
    40ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
    40ae:	89 44 24 04          	mov    %eax,0x4(%esp)
    40b2:	8b 45 08             	mov    0x8(%ebp),%eax
    40b5:	89 04 24             	mov    %eax,(%esp)
    40b8:	e8 4a ff ff ff       	call   4007 <write>
}
    40bd:	c9                   	leave  
    40be:	c3                   	ret    

000040bf <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    40bf:	55                   	push   %ebp
    40c0:	89 e5                	mov    %esp,%ebp
    40c2:	56                   	push   %esi
    40c3:	53                   	push   %ebx
    40c4:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    40c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    40ce:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    40d2:	74 17                	je     40eb <printint+0x2c>
    40d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    40d8:	79 11                	jns    40eb <printint+0x2c>
    neg = 1;
    40da:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    40e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    40e4:	f7 d8                	neg    %eax
    40e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    40e9:	eb 06                	jmp    40f1 <printint+0x32>
  } else {
    x = xx;
    40eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    40ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    40f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    40f8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    40fb:	8d 41 01             	lea    0x1(%ecx),%eax
    40fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4101:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4104:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4107:	ba 00 00 00 00       	mov    $0x0,%edx
    410c:	f7 f3                	div    %ebx
    410e:	89 d0                	mov    %edx,%eax
    4110:	0f b6 80 0c 64 00 00 	movzbl 0x640c(%eax),%eax
    4117:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    411b:	8b 75 10             	mov    0x10(%ebp),%esi
    411e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4121:	ba 00 00 00 00       	mov    $0x0,%edx
    4126:	f7 f6                	div    %esi
    4128:	89 45 ec             	mov    %eax,-0x14(%ebp)
    412b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    412f:	75 c7                	jne    40f8 <printint+0x39>
  if(neg)
    4131:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4135:	74 10                	je     4147 <printint+0x88>
    buf[i++] = '-';
    4137:	8b 45 f4             	mov    -0xc(%ebp),%eax
    413a:	8d 50 01             	lea    0x1(%eax),%edx
    413d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4140:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    4145:	eb 1f                	jmp    4166 <printint+0xa7>
    4147:	eb 1d                	jmp    4166 <printint+0xa7>
    putc(fd, buf[i]);
    4149:	8d 55 dc             	lea    -0x24(%ebp),%edx
    414c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    414f:	01 d0                	add    %edx,%eax
    4151:	0f b6 00             	movzbl (%eax),%eax
    4154:	0f be c0             	movsbl %al,%eax
    4157:	89 44 24 04          	mov    %eax,0x4(%esp)
    415b:	8b 45 08             	mov    0x8(%ebp),%eax
    415e:	89 04 24             	mov    %eax,(%esp)
    4161:	e8 31 ff ff ff       	call   4097 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    4166:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    416a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    416e:	79 d9                	jns    4149 <printint+0x8a>
    putc(fd, buf[i]);
}
    4170:	83 c4 30             	add    $0x30,%esp
    4173:	5b                   	pop    %ebx
    4174:	5e                   	pop    %esi
    4175:	5d                   	pop    %ebp
    4176:	c3                   	ret    

00004177 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4177:	55                   	push   %ebp
    4178:	89 e5                	mov    %esp,%ebp
    417a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    417d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    4184:	8d 45 0c             	lea    0xc(%ebp),%eax
    4187:	83 c0 04             	add    $0x4,%eax
    418a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    418d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4194:	e9 7c 01 00 00       	jmp    4315 <printf+0x19e>
    c = fmt[i] & 0xff;
    4199:	8b 55 0c             	mov    0xc(%ebp),%edx
    419c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    419f:	01 d0                	add    %edx,%eax
    41a1:	0f b6 00             	movzbl (%eax),%eax
    41a4:	0f be c0             	movsbl %al,%eax
    41a7:	25 ff 00 00 00       	and    $0xff,%eax
    41ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    41af:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    41b3:	75 2c                	jne    41e1 <printf+0x6a>
      if(c == '%'){
    41b5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    41b9:	75 0c                	jne    41c7 <printf+0x50>
        state = '%';
    41bb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    41c2:	e9 4a 01 00 00       	jmp    4311 <printf+0x19a>
      } else {
        putc(fd, c);
    41c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41ca:	0f be c0             	movsbl %al,%eax
    41cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    41d1:	8b 45 08             	mov    0x8(%ebp),%eax
    41d4:	89 04 24             	mov    %eax,(%esp)
    41d7:	e8 bb fe ff ff       	call   4097 <putc>
    41dc:	e9 30 01 00 00       	jmp    4311 <printf+0x19a>
      }
    } else if(state == '%'){
    41e1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    41e5:	0f 85 26 01 00 00    	jne    4311 <printf+0x19a>
      if(c == 'd'){
    41eb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    41ef:	75 2d                	jne    421e <printf+0xa7>
        printint(fd, *ap, 10, 1);
    41f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    41f4:	8b 00                	mov    (%eax),%eax
    41f6:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    41fd:	00 
    41fe:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    4205:	00 
    4206:	89 44 24 04          	mov    %eax,0x4(%esp)
    420a:	8b 45 08             	mov    0x8(%ebp),%eax
    420d:	89 04 24             	mov    %eax,(%esp)
    4210:	e8 aa fe ff ff       	call   40bf <printint>
        ap++;
    4215:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4219:	e9 ec 00 00 00       	jmp    430a <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    421e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    4222:	74 06                	je     422a <printf+0xb3>
    4224:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    4228:	75 2d                	jne    4257 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    422a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    422d:	8b 00                	mov    (%eax),%eax
    422f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    4236:	00 
    4237:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    423e:	00 
    423f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4243:	8b 45 08             	mov    0x8(%ebp),%eax
    4246:	89 04 24             	mov    %eax,(%esp)
    4249:	e8 71 fe ff ff       	call   40bf <printint>
        ap++;
    424e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4252:	e9 b3 00 00 00       	jmp    430a <printf+0x193>
      } else if(c == 's'){
    4257:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    425b:	75 45                	jne    42a2 <printf+0x12b>
        s = (char*)*ap;
    425d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4260:	8b 00                	mov    (%eax),%eax
    4262:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    4265:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    4269:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    426d:	75 09                	jne    4278 <printf+0x101>
          s = "(null)";
    426f:	c7 45 f4 0e 5d 00 00 	movl   $0x5d0e,-0xc(%ebp)
        while(*s != 0){
    4276:	eb 1e                	jmp    4296 <printf+0x11f>
    4278:	eb 1c                	jmp    4296 <printf+0x11f>
          putc(fd, *s);
    427a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    427d:	0f b6 00             	movzbl (%eax),%eax
    4280:	0f be c0             	movsbl %al,%eax
    4283:	89 44 24 04          	mov    %eax,0x4(%esp)
    4287:	8b 45 08             	mov    0x8(%ebp),%eax
    428a:	89 04 24             	mov    %eax,(%esp)
    428d:	e8 05 fe ff ff       	call   4097 <putc>
          s++;
    4292:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4296:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4299:	0f b6 00             	movzbl (%eax),%eax
    429c:	84 c0                	test   %al,%al
    429e:	75 da                	jne    427a <printf+0x103>
    42a0:	eb 68                	jmp    430a <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    42a2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    42a6:	75 1d                	jne    42c5 <printf+0x14e>
        putc(fd, *ap);
    42a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    42ab:	8b 00                	mov    (%eax),%eax
    42ad:	0f be c0             	movsbl %al,%eax
    42b0:	89 44 24 04          	mov    %eax,0x4(%esp)
    42b4:	8b 45 08             	mov    0x8(%ebp),%eax
    42b7:	89 04 24             	mov    %eax,(%esp)
    42ba:	e8 d8 fd ff ff       	call   4097 <putc>
        ap++;
    42bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    42c3:	eb 45                	jmp    430a <printf+0x193>
      } else if(c == '%'){
    42c5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    42c9:	75 17                	jne    42e2 <printf+0x16b>
        putc(fd, c);
    42cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    42ce:	0f be c0             	movsbl %al,%eax
    42d1:	89 44 24 04          	mov    %eax,0x4(%esp)
    42d5:	8b 45 08             	mov    0x8(%ebp),%eax
    42d8:	89 04 24             	mov    %eax,(%esp)
    42db:	e8 b7 fd ff ff       	call   4097 <putc>
    42e0:	eb 28                	jmp    430a <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    42e2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    42e9:	00 
    42ea:	8b 45 08             	mov    0x8(%ebp),%eax
    42ed:	89 04 24             	mov    %eax,(%esp)
    42f0:	e8 a2 fd ff ff       	call   4097 <putc>
        putc(fd, c);
    42f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    42f8:	0f be c0             	movsbl %al,%eax
    42fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    42ff:	8b 45 08             	mov    0x8(%ebp),%eax
    4302:	89 04 24             	mov    %eax,(%esp)
    4305:	e8 8d fd ff ff       	call   4097 <putc>
      }
      state = 0;
    430a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4311:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4315:	8b 55 0c             	mov    0xc(%ebp),%edx
    4318:	8b 45 f0             	mov    -0x10(%ebp),%eax
    431b:	01 d0                	add    %edx,%eax
    431d:	0f b6 00             	movzbl (%eax),%eax
    4320:	84 c0                	test   %al,%al
    4322:	0f 85 71 fe ff ff    	jne    4199 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4328:	c9                   	leave  
    4329:	c3                   	ret    

0000432a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    432a:	55                   	push   %ebp
    432b:	89 e5                	mov    %esp,%ebp
    432d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4330:	8b 45 08             	mov    0x8(%ebp),%eax
    4333:	83 e8 08             	sub    $0x8,%eax
    4336:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4339:	a1 a8 64 00 00       	mov    0x64a8,%eax
    433e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4341:	eb 24                	jmp    4367 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4343:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4346:	8b 00                	mov    (%eax),%eax
    4348:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    434b:	77 12                	ja     435f <free+0x35>
    434d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4350:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4353:	77 24                	ja     4379 <free+0x4f>
    4355:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4358:	8b 00                	mov    (%eax),%eax
    435a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    435d:	77 1a                	ja     4379 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    435f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4362:	8b 00                	mov    (%eax),%eax
    4364:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4367:	8b 45 f8             	mov    -0x8(%ebp),%eax
    436a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    436d:	76 d4                	jbe    4343 <free+0x19>
    436f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4372:	8b 00                	mov    (%eax),%eax
    4374:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4377:	76 ca                	jbe    4343 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4379:	8b 45 f8             	mov    -0x8(%ebp),%eax
    437c:	8b 40 04             	mov    0x4(%eax),%eax
    437f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4386:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4389:	01 c2                	add    %eax,%edx
    438b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    438e:	8b 00                	mov    (%eax),%eax
    4390:	39 c2                	cmp    %eax,%edx
    4392:	75 24                	jne    43b8 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    4394:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4397:	8b 50 04             	mov    0x4(%eax),%edx
    439a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    439d:	8b 00                	mov    (%eax),%eax
    439f:	8b 40 04             	mov    0x4(%eax),%eax
    43a2:	01 c2                	add    %eax,%edx
    43a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43a7:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    43aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43ad:	8b 00                	mov    (%eax),%eax
    43af:	8b 10                	mov    (%eax),%edx
    43b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43b4:	89 10                	mov    %edx,(%eax)
    43b6:	eb 0a                	jmp    43c2 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    43b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43bb:	8b 10                	mov    (%eax),%edx
    43bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43c0:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    43c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43c5:	8b 40 04             	mov    0x4(%eax),%eax
    43c8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    43cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43d2:	01 d0                	add    %edx,%eax
    43d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    43d7:	75 20                	jne    43f9 <free+0xcf>
    p->s.size += bp->s.size;
    43d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43dc:	8b 50 04             	mov    0x4(%eax),%edx
    43df:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43e2:	8b 40 04             	mov    0x4(%eax),%eax
    43e5:	01 c2                	add    %eax,%edx
    43e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43ea:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    43ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43f0:	8b 10                	mov    (%eax),%edx
    43f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43f5:	89 10                	mov    %edx,(%eax)
    43f7:	eb 08                	jmp    4401 <free+0xd7>
  } else
    p->s.ptr = bp;
    43f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43fc:	8b 55 f8             	mov    -0x8(%ebp),%edx
    43ff:	89 10                	mov    %edx,(%eax)
  freep = p;
    4401:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4404:	a3 a8 64 00 00       	mov    %eax,0x64a8
}
    4409:	c9                   	leave  
    440a:	c3                   	ret    

0000440b <morecore>:

static Header*
morecore(uint nu)
{
    440b:	55                   	push   %ebp
    440c:	89 e5                	mov    %esp,%ebp
    440e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4411:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4418:	77 07                	ja     4421 <morecore+0x16>
    nu = 4096;
    441a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4421:	8b 45 08             	mov    0x8(%ebp),%eax
    4424:	c1 e0 03             	shl    $0x3,%eax
    4427:	89 04 24             	mov    %eax,(%esp)
    442a:	e8 40 fc ff ff       	call   406f <sbrk>
    442f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4432:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4436:	75 07                	jne    443f <morecore+0x34>
    return 0;
    4438:	b8 00 00 00 00       	mov    $0x0,%eax
    443d:	eb 22                	jmp    4461 <morecore+0x56>
  hp = (Header*)p;
    443f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4442:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    4445:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4448:	8b 55 08             	mov    0x8(%ebp),%edx
    444b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    444e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4451:	83 c0 08             	add    $0x8,%eax
    4454:	89 04 24             	mov    %eax,(%esp)
    4457:	e8 ce fe ff ff       	call   432a <free>
  return freep;
    445c:	a1 a8 64 00 00       	mov    0x64a8,%eax
}
    4461:	c9                   	leave  
    4462:	c3                   	ret    

00004463 <malloc>:

void*
malloc(uint nbytes)
{
    4463:	55                   	push   %ebp
    4464:	89 e5                	mov    %esp,%ebp
    4466:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4469:	8b 45 08             	mov    0x8(%ebp),%eax
    446c:	83 c0 07             	add    $0x7,%eax
    446f:	c1 e8 03             	shr    $0x3,%eax
    4472:	83 c0 01             	add    $0x1,%eax
    4475:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    4478:	a1 a8 64 00 00       	mov    0x64a8,%eax
    447d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4480:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4484:	75 23                	jne    44a9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    4486:	c7 45 f0 a0 64 00 00 	movl   $0x64a0,-0x10(%ebp)
    448d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4490:	a3 a8 64 00 00       	mov    %eax,0x64a8
    4495:	a1 a8 64 00 00       	mov    0x64a8,%eax
    449a:	a3 a0 64 00 00       	mov    %eax,0x64a0
    base.s.size = 0;
    449f:	c7 05 a4 64 00 00 00 	movl   $0x0,0x64a4
    44a6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    44a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44ac:	8b 00                	mov    (%eax),%eax
    44ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    44b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44b4:	8b 40 04             	mov    0x4(%eax),%eax
    44b7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    44ba:	72 4d                	jb     4509 <malloc+0xa6>
      if(p->s.size == nunits)
    44bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44bf:	8b 40 04             	mov    0x4(%eax),%eax
    44c2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    44c5:	75 0c                	jne    44d3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    44c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44ca:	8b 10                	mov    (%eax),%edx
    44cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44cf:	89 10                	mov    %edx,(%eax)
    44d1:	eb 26                	jmp    44f9 <malloc+0x96>
      else {
        p->s.size -= nunits;
    44d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44d6:	8b 40 04             	mov    0x4(%eax),%eax
    44d9:	2b 45 ec             	sub    -0x14(%ebp),%eax
    44dc:	89 c2                	mov    %eax,%edx
    44de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    44e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44e7:	8b 40 04             	mov    0x4(%eax),%eax
    44ea:	c1 e0 03             	shl    $0x3,%eax
    44ed:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    44f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44f3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    44f6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    44f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44fc:	a3 a8 64 00 00       	mov    %eax,0x64a8
      return (void*)(p + 1);
    4501:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4504:	83 c0 08             	add    $0x8,%eax
    4507:	eb 38                	jmp    4541 <malloc+0xde>
    }
    if(p == freep)
    4509:	a1 a8 64 00 00       	mov    0x64a8,%eax
    450e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4511:	75 1b                	jne    452e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    4513:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4516:	89 04 24             	mov    %eax,(%esp)
    4519:	e8 ed fe ff ff       	call   440b <morecore>
    451e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4521:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4525:	75 07                	jne    452e <malloc+0xcb>
        return 0;
    4527:	b8 00 00 00 00       	mov    $0x0,%eax
    452c:	eb 13                	jmp    4541 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    452e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4531:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4534:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4537:	8b 00                	mov    (%eax),%eax
    4539:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    453c:	e9 70 ff ff ff       	jmp    44b1 <malloc+0x4e>
}
    4541:	c9                   	leave  
    4542:	c3                   	ret    
