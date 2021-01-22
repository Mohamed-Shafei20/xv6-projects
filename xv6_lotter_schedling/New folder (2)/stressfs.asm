
_stressfs:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
    1007:	b8 30 00 00 00       	mov    $0x30,%eax
{
    100c:	ff 71 fc             	pushl  -0x4(%ecx)
    100f:	55                   	push   %ebp
    1010:	89 e5                	mov    %esp,%ebp
    1012:	57                   	push   %edi
    1013:	56                   	push   %esi
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
    1016:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi

  for(i = 0; i < 4; i++)
    101c:	31 db                	xor    %ebx,%ebx
{
    101e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
    1024:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
    102b:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
    1032:	74 72 65 
  printf(1, "stressfs starting\n");
    1035:	68 60 18 00 00       	push   $0x1860
    103a:	6a 01                	push   $0x1
  char path[] = "stressfs0";
    103c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
    1043:	73 66 73 
  printf(1, "stressfs starting\n");
    1046:	e8 25 06 00 00       	call   1670 <printf>
  memset(data, 'a', sizeof(data));
    104b:	83 c4 0c             	add    $0xc,%esp
    104e:	68 00 02 00 00       	push   $0x200
    1053:	6a 61                	push   $0x61
    1055:	56                   	push   %esi
    1056:	e8 95 01 00 00       	call   11f0 <memset>
    105b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
    105e:	e8 b3 04 00 00       	call   1516 <fork>
    1063:	85 c0                	test   %eax,%eax
    1065:	0f 8f bf 00 00 00    	jg     112a <main+0x12a>
  for(i = 0; i < 4; i++)
    106b:	83 c3 01             	add    $0x1,%ebx
    106e:	83 fb 04             	cmp    $0x4,%ebx
    1071:	75 eb                	jne    105e <main+0x5e>
    1073:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
    1078:	83 ec 04             	sub    $0x4,%esp
    107b:	53                   	push   %ebx
    107c:	68 73 18 00 00       	push   $0x1873

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
    1081:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
    1086:	6a 01                	push   $0x1
    1088:	e8 e3 05 00 00       	call   1670 <printf>
  path[8] += i;
    108d:	89 f8                	mov    %edi,%eax
    108f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
    1095:	5f                   	pop    %edi
    1096:	58                   	pop    %eax
    1097:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    109d:	68 02 02 00 00       	push   $0x202
    10a2:	50                   	push   %eax
    10a3:	e8 b6 04 00 00       	call   155e <open>
    10a8:	83 c4 10             	add    $0x10,%esp
    10ab:	89 c7                	mov    %eax,%edi
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 02 00 00       	push   $0x200
    10b8:	56                   	push   %esi
    10b9:	57                   	push   %edi
    10ba:	e8 7f 04 00 00       	call   153e <write>
  for(i = 0; i < 20; i++)
    10bf:	83 c4 10             	add    $0x10,%esp
    10c2:	83 eb 01             	sub    $0x1,%ebx
    10c5:	75 e9                	jne    10b0 <main+0xb0>
  close(fd);
    10c7:	83 ec 0c             	sub    $0xc,%esp
    10ca:	57                   	push   %edi
    10cb:	e8 76 04 00 00       	call   1546 <close>

  printf(1, "read\n");
    10d0:	58                   	pop    %eax
    10d1:	5a                   	pop    %edx
    10d2:	68 7d 18 00 00       	push   $0x187d
    10d7:	6a 01                	push   $0x1
    10d9:	e8 92 05 00 00       	call   1670 <printf>

  fd = open(path, O_RDONLY);
    10de:	59                   	pop    %ecx
    10df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
    10e5:	5b                   	pop    %ebx
    10e6:	6a 00                	push   $0x0
    10e8:	50                   	push   %eax
    10e9:	bb 14 00 00 00       	mov    $0x14,%ebx
    10ee:	e8 6b 04 00 00       	call   155e <open>
    10f3:	83 c4 10             	add    $0x10,%esp
    10f6:	89 c7                	mov    %eax,%edi
    10f8:	90                   	nop
    10f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
    1100:	83 ec 04             	sub    $0x4,%esp
    1103:	68 00 02 00 00       	push   $0x200
    1108:	56                   	push   %esi
    1109:	57                   	push   %edi
    110a:	e8 27 04 00 00       	call   1536 <read>
  for (i = 0; i < 20; i++)
    110f:	83 c4 10             	add    $0x10,%esp
    1112:	83 eb 01             	sub    $0x1,%ebx
    1115:	75 e9                	jne    1100 <main+0x100>
  close(fd);
    1117:	83 ec 0c             	sub    $0xc,%esp
    111a:	57                   	push   %edi
    111b:	e8 26 04 00 00       	call   1546 <close>

  wait();
    1120:	e8 01 04 00 00       	call   1526 <wait>

  exit();
    1125:	e8 f4 03 00 00       	call   151e <exit>
    112a:	89 df                	mov    %ebx,%edi
    112c:	e9 47 ff ff ff       	jmp    1078 <main+0x78>
    1131:	66 90                	xchg   %ax,%ax
    1133:	66 90                	xchg   %ax,%ax
    1135:	66 90                	xchg   %ax,%ax
    1137:	66 90                	xchg   %ax,%ax
    1139:	66 90                	xchg   %ax,%ax
    113b:	66 90                	xchg   %ax,%ax
    113d:	66 90                	xchg   %ax,%ax
    113f:	90                   	nop

00001140 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 45 08             	mov    0x8(%ebp),%eax
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    114a:	89 c2                	mov    %eax,%edx
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1150:	83 c1 01             	add    $0x1,%ecx
    1153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1157:	83 c2 01             	add    $0x1,%edx
    115a:	84 db                	test   %bl,%bl
    115c:	88 5a ff             	mov    %bl,-0x1(%edx)
    115f:	75 ef                	jne    1150 <strcpy+0x10>
    ;
  return os;
}
    1161:	5b                   	pop    %ebx
    1162:	5d                   	pop    %ebp
    1163:	c3                   	ret    
    1164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    116a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	8b 55 08             	mov    0x8(%ebp),%edx
    1177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    117a:	0f b6 02             	movzbl (%edx),%eax
    117d:	0f b6 19             	movzbl (%ecx),%ebx
    1180:	84 c0                	test   %al,%al
    1182:	75 1c                	jne    11a0 <strcmp+0x30>
    1184:	eb 2a                	jmp    11b0 <strcmp+0x40>
    1186:	8d 76 00             	lea    0x0(%esi),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1190:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1193:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1196:	83 c1 01             	add    $0x1,%ecx
    1199:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    119c:	84 c0                	test   %al,%al
    119e:	74 10                	je     11b0 <strcmp+0x40>
    11a0:	38 d8                	cmp    %bl,%al
    11a2:	74 ec                	je     1190 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    11a4:	29 d8                	sub    %ebx,%eax
}
    11a6:	5b                   	pop    %ebx
    11a7:	5d                   	pop    %ebp
    11a8:	c3                   	ret    
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    11b2:	29 d8                	sub    %ebx,%eax
}
    11b4:	5b                   	pop    %ebx
    11b5:	5d                   	pop    %ebp
    11b6:	c3                   	ret    
    11b7:	89 f6                	mov    %esi,%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <strlen>:

uint
strlen(const char *s)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    11c6:	80 39 00             	cmpb   $0x0,(%ecx)
    11c9:	74 15                	je     11e0 <strlen+0x20>
    11cb:	31 d2                	xor    %edx,%edx
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
    11d0:	83 c2 01             	add    $0x1,%edx
    11d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11d7:	89 d0                	mov    %edx,%eax
    11d9:	75 f5                	jne    11d0 <strlen+0x10>
    ;
  return n;
}
    11db:	5d                   	pop    %ebp
    11dc:	c3                   	ret    
    11dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    11e0:	31 c0                	xor    %eax,%eax
}
    11e2:	5d                   	pop    %ebp
    11e3:	c3                   	ret    
    11e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	57                   	push   %edi
    11f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    11fd:	89 d7                	mov    %edx,%edi
    11ff:	fc                   	cld    
    1200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1202:	89 d0                	mov    %edx,%eax
    1204:	5f                   	pop    %edi
    1205:	5d                   	pop    %ebp
    1206:	c3                   	ret    
    1207:	89 f6                	mov    %esi,%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <strchr>:

char*
strchr(const char *s, char c)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	8b 45 08             	mov    0x8(%ebp),%eax
    1217:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    121a:	0f b6 10             	movzbl (%eax),%edx
    121d:	84 d2                	test   %dl,%dl
    121f:	74 1d                	je     123e <strchr+0x2e>
    if(*s == c)
    1221:	38 d3                	cmp    %dl,%bl
    1223:	89 d9                	mov    %ebx,%ecx
    1225:	75 0d                	jne    1234 <strchr+0x24>
    1227:	eb 17                	jmp    1240 <strchr+0x30>
    1229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1230:	38 ca                	cmp    %cl,%dl
    1232:	74 0c                	je     1240 <strchr+0x30>
  for(; *s; s++)
    1234:	83 c0 01             	add    $0x1,%eax
    1237:	0f b6 10             	movzbl (%eax),%edx
    123a:	84 d2                	test   %dl,%dl
    123c:	75 f2                	jne    1230 <strchr+0x20>
      return (char*)s;
  return 0;
    123e:	31 c0                	xor    %eax,%eax
}
    1240:	5b                   	pop    %ebx
    1241:	5d                   	pop    %ebp
    1242:	c3                   	ret    
    1243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <gets>:

char*
gets(char *buf, int max)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	56                   	push   %esi
    1255:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1256:	31 f6                	xor    %esi,%esi
    1258:	89 f3                	mov    %esi,%ebx
{
    125a:	83 ec 1c             	sub    $0x1c,%esp
    125d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1260:	eb 2f                	jmp    1291 <gets+0x41>
    1262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1268:	8d 45 e7             	lea    -0x19(%ebp),%eax
    126b:	83 ec 04             	sub    $0x4,%esp
    126e:	6a 01                	push   $0x1
    1270:	50                   	push   %eax
    1271:	6a 00                	push   $0x0
    1273:	e8 be 02 00 00       	call   1536 <read>
    if(cc < 1)
    1278:	83 c4 10             	add    $0x10,%esp
    127b:	85 c0                	test   %eax,%eax
    127d:	7e 1c                	jle    129b <gets+0x4b>
      break;
    buf[i++] = c;
    127f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1283:	83 c7 01             	add    $0x1,%edi
    1286:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1289:	3c 0a                	cmp    $0xa,%al
    128b:	74 23                	je     12b0 <gets+0x60>
    128d:	3c 0d                	cmp    $0xd,%al
    128f:	74 1f                	je     12b0 <gets+0x60>
  for(i=0; i+1 < max; ){
    1291:	83 c3 01             	add    $0x1,%ebx
    1294:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1297:	89 fe                	mov    %edi,%esi
    1299:	7c cd                	jl     1268 <gets+0x18>
    129b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    129d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    12a0:	c6 03 00             	movb   $0x0,(%ebx)
}
    12a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12a6:	5b                   	pop    %ebx
    12a7:	5e                   	pop    %esi
    12a8:	5f                   	pop    %edi
    12a9:	5d                   	pop    %ebp
    12aa:	c3                   	ret    
    12ab:	90                   	nop
    12ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12b0:	8b 75 08             	mov    0x8(%ebp),%esi
    12b3:	8b 45 08             	mov    0x8(%ebp),%eax
    12b6:	01 de                	add    %ebx,%esi
    12b8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    12ba:	c6 03 00             	movb   $0x0,(%ebx)
}
    12bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12c0:	5b                   	pop    %ebx
    12c1:	5e                   	pop    %esi
    12c2:	5f                   	pop    %edi
    12c3:	5d                   	pop    %ebp
    12c4:	c3                   	ret    
    12c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012d0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	56                   	push   %esi
    12d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12d5:	83 ec 08             	sub    $0x8,%esp
    12d8:	6a 00                	push   $0x0
    12da:	ff 75 08             	pushl  0x8(%ebp)
    12dd:	e8 7c 02 00 00       	call   155e <open>
  if(fd < 0)
    12e2:	83 c4 10             	add    $0x10,%esp
    12e5:	85 c0                	test   %eax,%eax
    12e7:	78 27                	js     1310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12e9:	83 ec 08             	sub    $0x8,%esp
    12ec:	ff 75 0c             	pushl  0xc(%ebp)
    12ef:	89 c3                	mov    %eax,%ebx
    12f1:	50                   	push   %eax
    12f2:	e8 7f 02 00 00       	call   1576 <fstat>
  close(fd);
    12f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12fa:	89 c6                	mov    %eax,%esi
  close(fd);
    12fc:	e8 45 02 00 00       	call   1546 <close>
  return r;
    1301:	83 c4 10             	add    $0x10,%esp
}
    1304:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1307:	89 f0                	mov    %esi,%eax
    1309:	5b                   	pop    %ebx
    130a:	5e                   	pop    %esi
    130b:	5d                   	pop    %ebp
    130c:	c3                   	ret    
    130d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1310:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1315:	eb ed                	jmp    1304 <stat+0x34>
    1317:	89 f6                	mov    %esi,%esi
    1319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001320 <atoi>:

int
atoi(const char *s)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	53                   	push   %ebx
    1324:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1327:	0f be 11             	movsbl (%ecx),%edx
    132a:	8d 42 d0             	lea    -0x30(%edx),%eax
    132d:	3c 09                	cmp    $0x9,%al
  n = 0;
    132f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1334:	77 1f                	ja     1355 <atoi+0x35>
    1336:	8d 76 00             	lea    0x0(%esi),%esi
    1339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1340:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1343:	83 c1 01             	add    $0x1,%ecx
    1346:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    134a:	0f be 11             	movsbl (%ecx),%edx
    134d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1350:	80 fb 09             	cmp    $0x9,%bl
    1353:	76 eb                	jbe    1340 <atoi+0x20>
  return n;
}
    1355:	5b                   	pop    %ebx
    1356:	5d                   	pop    %ebp
    1357:	c3                   	ret    
    1358:	90                   	nop
    1359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	56                   	push   %esi
    1364:	53                   	push   %ebx
    1365:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1368:	8b 45 08             	mov    0x8(%ebp),%eax
    136b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    136e:	85 db                	test   %ebx,%ebx
    1370:	7e 14                	jle    1386 <memmove+0x26>
    1372:	31 d2                	xor    %edx,%edx
    1374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1378:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    137c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    137f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1382:	39 d3                	cmp    %edx,%ebx
    1384:	75 f2                	jne    1378 <memmove+0x18>
  return vdst;
}
    1386:	5b                   	pop    %ebx
    1387:	5e                   	pop    %esi
    1388:	5d                   	pop    %ebp
    1389:	c3                   	ret    
    138a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001390 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1390:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1391:	a1 3c 1b 00 00       	mov    0x1b3c,%eax
{
    1396:	89 e5                	mov    %esp,%ebp
    1398:	57                   	push   %edi
    1399:	56                   	push   %esi
    139a:	53                   	push   %ebx
    139b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    139e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    13a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13a8:	39 c8                	cmp    %ecx,%eax
    13aa:	8b 10                	mov    (%eax),%edx
    13ac:	73 32                	jae    13e0 <free+0x50>
    13ae:	39 d1                	cmp    %edx,%ecx
    13b0:	72 04                	jb     13b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13b2:	39 d0                	cmp    %edx,%eax
    13b4:	72 32                	jb     13e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    13b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    13b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    13bc:	39 fa                	cmp    %edi,%edx
    13be:	74 30                	je     13f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    13c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13c3:	8b 50 04             	mov    0x4(%eax),%edx
    13c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13c9:	39 f1                	cmp    %esi,%ecx
    13cb:	74 3a                	je     1407 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    13cd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    13cf:	a3 3c 1b 00 00       	mov    %eax,0x1b3c
}
    13d4:	5b                   	pop    %ebx
    13d5:	5e                   	pop    %esi
    13d6:	5f                   	pop    %edi
    13d7:	5d                   	pop    %ebp
    13d8:	c3                   	ret    
    13d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13e0:	39 d0                	cmp    %edx,%eax
    13e2:	72 04                	jb     13e8 <free+0x58>
    13e4:	39 d1                	cmp    %edx,%ecx
    13e6:	72 ce                	jb     13b6 <free+0x26>
{
    13e8:	89 d0                	mov    %edx,%eax
    13ea:	eb bc                	jmp    13a8 <free+0x18>
    13ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    13f0:	03 72 04             	add    0x4(%edx),%esi
    13f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    13f6:	8b 10                	mov    (%eax),%edx
    13f8:	8b 12                	mov    (%edx),%edx
    13fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13fd:	8b 50 04             	mov    0x4(%eax),%edx
    1400:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1403:	39 f1                	cmp    %esi,%ecx
    1405:	75 c6                	jne    13cd <free+0x3d>
    p->s.size += bp->s.size;
    1407:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    140a:	a3 3c 1b 00 00       	mov    %eax,0x1b3c
    p->s.size += bp->s.size;
    140f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1412:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1415:	89 10                	mov    %edx,(%eax)
}
    1417:	5b                   	pop    %ebx
    1418:	5e                   	pop    %esi
    1419:	5f                   	pop    %edi
    141a:	5d                   	pop    %ebp
    141b:	c3                   	ret    
    141c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001420 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1429:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    142c:	8b 15 3c 1b 00 00    	mov    0x1b3c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1432:	8d 78 07             	lea    0x7(%eax),%edi
    1435:	c1 ef 03             	shr    $0x3,%edi
    1438:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    143b:	85 d2                	test   %edx,%edx
    143d:	0f 84 9d 00 00 00    	je     14e0 <malloc+0xc0>
    1443:	8b 02                	mov    (%edx),%eax
    1445:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1448:	39 cf                	cmp    %ecx,%edi
    144a:	76 6c                	jbe    14b8 <malloc+0x98>
    144c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1452:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1457:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    145a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1461:	eb 0e                	jmp    1471 <malloc+0x51>
    1463:	90                   	nop
    1464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1468:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    146a:	8b 48 04             	mov    0x4(%eax),%ecx
    146d:	39 f9                	cmp    %edi,%ecx
    146f:	73 47                	jae    14b8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1471:	39 05 3c 1b 00 00    	cmp    %eax,0x1b3c
    1477:	89 c2                	mov    %eax,%edx
    1479:	75 ed                	jne    1468 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    147b:	83 ec 0c             	sub    $0xc,%esp
    147e:	56                   	push   %esi
    147f:	e8 22 01 00 00       	call   15a6 <sbrk>
  if(p == (char*)-1)
    1484:	83 c4 10             	add    $0x10,%esp
    1487:	83 f8 ff             	cmp    $0xffffffff,%eax
    148a:	74 1c                	je     14a8 <malloc+0x88>
  hp->s.size = nu;
    148c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    148f:	83 ec 0c             	sub    $0xc,%esp
    1492:	83 c0 08             	add    $0x8,%eax
    1495:	50                   	push   %eax
    1496:	e8 f5 fe ff ff       	call   1390 <free>
  return freep;
    149b:	8b 15 3c 1b 00 00    	mov    0x1b3c,%edx
      if((p = morecore(nunits)) == 0)
    14a1:	83 c4 10             	add    $0x10,%esp
    14a4:	85 d2                	test   %edx,%edx
    14a6:	75 c0                	jne    1468 <malloc+0x48>
        return 0;
  }
}
    14a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    14ab:	31 c0                	xor    %eax,%eax
}
    14ad:	5b                   	pop    %ebx
    14ae:	5e                   	pop    %esi
    14af:	5f                   	pop    %edi
    14b0:	5d                   	pop    %ebp
    14b1:	c3                   	ret    
    14b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    14b8:	39 cf                	cmp    %ecx,%edi
    14ba:	74 54                	je     1510 <malloc+0xf0>
        p->s.size -= nunits;
    14bc:	29 f9                	sub    %edi,%ecx
    14be:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    14c1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    14c4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    14c7:	89 15 3c 1b 00 00    	mov    %edx,0x1b3c
}
    14cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    14d0:	83 c0 08             	add    $0x8,%eax
}
    14d3:	5b                   	pop    %ebx
    14d4:	5e                   	pop    %esi
    14d5:	5f                   	pop    %edi
    14d6:	5d                   	pop    %ebp
    14d7:	c3                   	ret    
    14d8:	90                   	nop
    14d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    14e0:	c7 05 3c 1b 00 00 40 	movl   $0x1b40,0x1b3c
    14e7:	1b 00 00 
    14ea:	c7 05 40 1b 00 00 40 	movl   $0x1b40,0x1b40
    14f1:	1b 00 00 
    base.s.size = 0;
    14f4:	b8 40 1b 00 00       	mov    $0x1b40,%eax
    14f9:	c7 05 44 1b 00 00 00 	movl   $0x0,0x1b44
    1500:	00 00 00 
    1503:	e9 44 ff ff ff       	jmp    144c <malloc+0x2c>
    1508:	90                   	nop
    1509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1510:	8b 08                	mov    (%eax),%ecx
    1512:	89 0a                	mov    %ecx,(%edx)
    1514:	eb b1                	jmp    14c7 <malloc+0xa7>

00001516 <fork>:
    1516:	b8 01 00 00 00       	mov    $0x1,%eax
    151b:	cd 40                	int    $0x40
    151d:	c3                   	ret    

0000151e <exit>:
    151e:	b8 02 00 00 00       	mov    $0x2,%eax
    1523:	cd 40                	int    $0x40
    1525:	c3                   	ret    

00001526 <wait>:
    1526:	b8 03 00 00 00       	mov    $0x3,%eax
    152b:	cd 40                	int    $0x40
    152d:	c3                   	ret    

0000152e <pipe>:
    152e:	b8 04 00 00 00       	mov    $0x4,%eax
    1533:	cd 40                	int    $0x40
    1535:	c3                   	ret    

00001536 <read>:
    1536:	b8 05 00 00 00       	mov    $0x5,%eax
    153b:	cd 40                	int    $0x40
    153d:	c3                   	ret    

0000153e <write>:
    153e:	b8 10 00 00 00       	mov    $0x10,%eax
    1543:	cd 40                	int    $0x40
    1545:	c3                   	ret    

00001546 <close>:
    1546:	b8 15 00 00 00       	mov    $0x15,%eax
    154b:	cd 40                	int    $0x40
    154d:	c3                   	ret    

0000154e <kill>:
    154e:	b8 06 00 00 00       	mov    $0x6,%eax
    1553:	cd 40                	int    $0x40
    1555:	c3                   	ret    

00001556 <exec>:
    1556:	b8 07 00 00 00       	mov    $0x7,%eax
    155b:	cd 40                	int    $0x40
    155d:	c3                   	ret    

0000155e <open>:
    155e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1563:	cd 40                	int    $0x40
    1565:	c3                   	ret    

00001566 <mknod>:
    1566:	b8 11 00 00 00       	mov    $0x11,%eax
    156b:	cd 40                	int    $0x40
    156d:	c3                   	ret    

0000156e <unlink>:
    156e:	b8 12 00 00 00       	mov    $0x12,%eax
    1573:	cd 40                	int    $0x40
    1575:	c3                   	ret    

00001576 <fstat>:
    1576:	b8 08 00 00 00       	mov    $0x8,%eax
    157b:	cd 40                	int    $0x40
    157d:	c3                   	ret    

0000157e <link>:
    157e:	b8 13 00 00 00       	mov    $0x13,%eax
    1583:	cd 40                	int    $0x40
    1585:	c3                   	ret    

00001586 <mkdir>:
    1586:	b8 14 00 00 00       	mov    $0x14,%eax
    158b:	cd 40                	int    $0x40
    158d:	c3                   	ret    

0000158e <chdir>:
    158e:	b8 09 00 00 00       	mov    $0x9,%eax
    1593:	cd 40                	int    $0x40
    1595:	c3                   	ret    

00001596 <dup>:
    1596:	b8 0a 00 00 00       	mov    $0xa,%eax
    159b:	cd 40                	int    $0x40
    159d:	c3                   	ret    

0000159e <getpid>:
    159e:	b8 0b 00 00 00       	mov    $0xb,%eax
    15a3:	cd 40                	int    $0x40
    15a5:	c3                   	ret    

000015a6 <sbrk>:
    15a6:	b8 0c 00 00 00       	mov    $0xc,%eax
    15ab:	cd 40                	int    $0x40
    15ad:	c3                   	ret    

000015ae <sleep>:
    15ae:	b8 0d 00 00 00       	mov    $0xd,%eax
    15b3:	cd 40                	int    $0x40
    15b5:	c3                   	ret    

000015b6 <uptime>:
    15b6:	b8 0e 00 00 00       	mov    $0xe,%eax
    15bb:	cd 40                	int    $0x40
    15bd:	c3                   	ret    

000015be <settickets>:
    15be:	b8 16 00 00 00       	mov    $0x16,%eax
    15c3:	cd 40                	int    $0x40
    15c5:	c3                   	ret    

000015c6 <getpinfo>:
    15c6:	b8 17 00 00 00       	mov    $0x17,%eax
    15cb:	cd 40                	int    $0x40
    15cd:	c3                   	ret    
    15ce:	66 90                	xchg   %ax,%ax

000015d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    15d0:	55                   	push   %ebp
    15d1:	89 e5                	mov    %esp,%ebp
    15d3:	57                   	push   %edi
    15d4:	56                   	push   %esi
    15d5:	53                   	push   %ebx
    15d6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    15d9:	85 d2                	test   %edx,%edx
{
    15db:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    15de:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    15e0:	79 76                	jns    1658 <printint+0x88>
    15e2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    15e6:	74 70                	je     1658 <printint+0x88>
    x = -xx;
    15e8:	f7 d8                	neg    %eax
    neg = 1;
    15ea:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    15f1:	31 f6                	xor    %esi,%esi
    15f3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    15f6:	eb 0a                	jmp    1602 <printint+0x32>
    15f8:	90                   	nop
    15f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1600:	89 fe                	mov    %edi,%esi
    1602:	31 d2                	xor    %edx,%edx
    1604:	8d 7e 01             	lea    0x1(%esi),%edi
    1607:	f7 f1                	div    %ecx
    1609:	0f b6 92 8c 18 00 00 	movzbl 0x188c(%edx),%edx
  }while((x /= base) != 0);
    1610:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1612:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1615:	75 e9                	jne    1600 <printint+0x30>
  if(neg)
    1617:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    161a:	85 c0                	test   %eax,%eax
    161c:	74 08                	je     1626 <printint+0x56>
    buf[i++] = '-';
    161e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1623:	8d 7e 02             	lea    0x2(%esi),%edi
    1626:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    162a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    162d:	8d 76 00             	lea    0x0(%esi),%esi
    1630:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1633:	83 ec 04             	sub    $0x4,%esp
    1636:	83 ee 01             	sub    $0x1,%esi
    1639:	6a 01                	push   $0x1
    163b:	53                   	push   %ebx
    163c:	57                   	push   %edi
    163d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1640:	e8 f9 fe ff ff       	call   153e <write>

  while(--i >= 0)
    1645:	83 c4 10             	add    $0x10,%esp
    1648:	39 de                	cmp    %ebx,%esi
    164a:	75 e4                	jne    1630 <printint+0x60>
    putc(fd, buf[i]);
}
    164c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    164f:	5b                   	pop    %ebx
    1650:	5e                   	pop    %esi
    1651:	5f                   	pop    %edi
    1652:	5d                   	pop    %ebp
    1653:	c3                   	ret    
    1654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1658:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    165f:	eb 90                	jmp    15f1 <printint+0x21>
    1661:	eb 0d                	jmp    1670 <printf>
    1663:	90                   	nop
    1664:	90                   	nop
    1665:	90                   	nop
    1666:	90                   	nop
    1667:	90                   	nop
    1668:	90                   	nop
    1669:	90                   	nop
    166a:	90                   	nop
    166b:	90                   	nop
    166c:	90                   	nop
    166d:	90                   	nop
    166e:	90                   	nop
    166f:	90                   	nop

00001670 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1670:	55                   	push   %ebp
    1671:	89 e5                	mov    %esp,%ebp
    1673:	57                   	push   %edi
    1674:	56                   	push   %esi
    1675:	53                   	push   %ebx
    1676:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1679:	8b 75 0c             	mov    0xc(%ebp),%esi
    167c:	0f b6 1e             	movzbl (%esi),%ebx
    167f:	84 db                	test   %bl,%bl
    1681:	0f 84 bf 00 00 00    	je     1746 <printf+0xd6>
    1687:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    168a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    168d:	31 d2                	xor    %edx,%edx
    168f:	eb 39                	jmp    16ca <printf+0x5a>
    1691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1698:	83 f8 25             	cmp    $0x25,%eax
    169b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    169e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    16a3:	74 1a                	je     16bf <printf+0x4f>
  write(fd, &c, 1);
    16a5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    16a8:	83 ec 04             	sub    $0x4,%esp
    16ab:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    16ae:	6a 01                	push   $0x1
    16b0:	50                   	push   %eax
    16b1:	ff 75 08             	pushl  0x8(%ebp)
    16b4:	e8 85 fe ff ff       	call   153e <write>
    16b9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    16bc:	83 c4 10             	add    $0x10,%esp
    16bf:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    16c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    16c6:	84 db                	test   %bl,%bl
    16c8:	74 7c                	je     1746 <printf+0xd6>
    if(state == 0){
    16ca:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    16cc:	0f be cb             	movsbl %bl,%ecx
    16cf:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    16d2:	74 c4                	je     1698 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    16d4:	83 fa 25             	cmp    $0x25,%edx
    16d7:	75 e6                	jne    16bf <printf+0x4f>
      if(c == 'd'){
    16d9:	83 f8 64             	cmp    $0x64,%eax
    16dc:	0f 84 a6 00 00 00    	je     1788 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    16e2:	83 f8 6c             	cmp    $0x6c,%eax
    16e5:	0f 84 ad 00 00 00    	je     1798 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    16eb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    16f1:	83 f9 70             	cmp    $0x70,%ecx
    16f4:	74 5a                	je     1750 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16f6:	83 f8 73             	cmp    $0x73,%eax
    16f9:	0f 84 e1 00 00 00    	je     17e0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16ff:	83 f8 63             	cmp    $0x63,%eax
    1702:	0f 84 28 01 00 00    	je     1830 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1708:	83 f8 25             	cmp    $0x25,%eax
    170b:	74 6b                	je     1778 <printf+0x108>
  write(fd, &c, 1);
    170d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1710:	83 ec 04             	sub    $0x4,%esp
    1713:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1717:	6a 01                	push   $0x1
    1719:	50                   	push   %eax
    171a:	ff 75 08             	pushl  0x8(%ebp)
    171d:	e8 1c fe ff ff       	call   153e <write>
    1722:	83 c4 0c             	add    $0xc,%esp
    1725:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1728:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    172b:	6a 01                	push   $0x1
    172d:	50                   	push   %eax
    172e:	ff 75 08             	pushl  0x8(%ebp)
    1731:	83 c6 01             	add    $0x1,%esi
    1734:	e8 05 fe ff ff       	call   153e <write>
  for(i = 0; fmt[i]; i++){
    1739:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    173d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1740:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1742:	84 db                	test   %bl,%bl
    1744:	75 84                	jne    16ca <printf+0x5a>
    }
  }
}
    1746:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1749:	5b                   	pop    %ebx
    174a:	5e                   	pop    %esi
    174b:	5f                   	pop    %edi
    174c:	5d                   	pop    %ebp
    174d:	c3                   	ret    
    174e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1750:	83 ec 0c             	sub    $0xc,%esp
    1753:	b9 10 00 00 00       	mov    $0x10,%ecx
    1758:	6a 00                	push   $0x0
    175a:	8b 17                	mov    (%edi),%edx
    175c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    175f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1762:	e8 69 fe ff ff       	call   15d0 <printint>
    1767:	83 c4 10             	add    $0x10,%esp
      state = 0;
    176a:	31 d2                	xor    %edx,%edx
    176c:	e9 4e ff ff ff       	jmp    16bf <printf+0x4f>
    1771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1778:	83 ec 04             	sub    $0x4,%esp
    177b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    177e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1781:	6a 01                	push   $0x1
    1783:	eb a8                	jmp    172d <printf+0xbd>
    1785:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1788:	83 ec 0c             	sub    $0xc,%esp
    178b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1790:	6a 01                	push   $0x1
    1792:	eb c6                	jmp    175a <printf+0xea>
    1794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1798:	8b 57 04             	mov    0x4(%edi),%edx
    179b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    179d:	85 d2                	test   %edx,%edx
    179f:	74 15                	je     17b6 <printf+0x146>
    17a1:	83 ec 0c             	sub    $0xc,%esp
    17a4:	8b 45 08             	mov    0x8(%ebp),%eax
    17a7:	b9 10 00 00 00       	mov    $0x10,%ecx
    17ac:	6a 00                	push   $0x0
    17ae:	e8 1d fe ff ff       	call   15d0 <printint>
    17b3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    17b6:	83 ec 0c             	sub    $0xc,%esp
    17b9:	8b 45 08             	mov    0x8(%ebp),%eax
    17bc:	89 da                	mov    %ebx,%edx
    17be:	6a 00                	push   $0x0
    17c0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    17c5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    17c8:	e8 03 fe ff ff       	call   15d0 <printint>
    17cd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17d0:	31 d2                	xor    %edx,%edx
    17d2:	e9 e8 fe ff ff       	jmp    16bf <printf+0x4f>
    17d7:	89 f6                	mov    %esi,%esi
    17d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    17e0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    17e2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    17e5:	85 c9                	test   %ecx,%ecx
    17e7:	74 6a                	je     1853 <printf+0x1e3>
        while(*s != 0){
    17e9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    17ec:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    17ee:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    17f0:	84 c0                	test   %al,%al
    17f2:	0f 84 c7 fe ff ff    	je     16bf <printf+0x4f>
    17f8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    17fb:	89 de                	mov    %ebx,%esi
    17fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1800:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1803:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1806:	83 ec 04             	sub    $0x4,%esp
    1809:	6a 01                	push   $0x1
          s++;
    180b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    180e:	50                   	push   %eax
    180f:	53                   	push   %ebx
    1810:	e8 29 fd ff ff       	call   153e <write>
        while(*s != 0){
    1815:	0f b6 06             	movzbl (%esi),%eax
    1818:	83 c4 10             	add    $0x10,%esp
    181b:	84 c0                	test   %al,%al
    181d:	75 e1                	jne    1800 <printf+0x190>
    181f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    1822:	31 d2                	xor    %edx,%edx
    1824:	e9 96 fe ff ff       	jmp    16bf <printf+0x4f>
    1829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1830:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1832:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1835:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1838:	6a 01                	push   $0x1
        putc(fd, *ap);
    183a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    183d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1840:	50                   	push   %eax
    1841:	ff 75 08             	pushl  0x8(%ebp)
    1844:	e8 f5 fc ff ff       	call   153e <write>
    1849:	83 c4 10             	add    $0x10,%esp
      state = 0;
    184c:	31 d2                	xor    %edx,%edx
    184e:	e9 6c fe ff ff       	jmp    16bf <printf+0x4f>
          s = "(null)";
    1853:	bb 83 18 00 00       	mov    $0x1883,%ebx
        while(*s != 0){
    1858:	b8 28 00 00 00       	mov    $0x28,%eax
    185d:	eb 99                	jmp    17f8 <printf+0x188>
