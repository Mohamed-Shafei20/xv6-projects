
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  }
}

int
main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	be 01 00 00 00       	mov    $0x1,%esi
    1016:	83 ec 18             	sub    $0x18,%esp
    1019:	8b 01                	mov    (%ecx),%eax
    101b:	8b 59 04             	mov    0x4(%ecx),%ebx
    101e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1021:	83 f8 01             	cmp    $0x1,%eax
{
    1024:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(argc <= 1){
    1027:	7e 54                	jle    107d <main+0x7d>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 f2 04 00 00       	call   152e <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	85 c0                	test   %eax,%eax
    1041:	89 c7                	mov    %eax,%edi
    1043:	78 24                	js     1069 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    1045:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
    1048:	83 c6 01             	add    $0x1,%esi
    104b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
    104e:	50                   	push   %eax
    104f:	e8 3c 00 00 00       	call   1090 <cat>
    close(fd);
    1054:	89 3c 24             	mov    %edi,(%esp)
    1057:	e8 ba 04 00 00       	call   1516 <close>
  for(i = 1; i < argc; i++){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1062:	75 cc                	jne    1030 <main+0x30>
  }
  exit();
    1064:	e8 85 04 00 00       	call   14ee <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
    1069:	50                   	push   %eax
    106a:	ff 33                	pushl  (%ebx)
    106c:	68 53 18 00 00       	push   $0x1853
    1071:	6a 01                	push   $0x1
    1073:	e8 c8 05 00 00       	call   1640 <printf>
      exit();
    1078:	e8 71 04 00 00       	call   14ee <exit>
    cat(0);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	6a 00                	push   $0x0
    1082:	e8 09 00 00 00       	call   1090 <cat>
    exit();
    1087:	e8 62 04 00 00       	call   14ee <exit>
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <cat>:
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	53                   	push   %ebx
    1095:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    1098:	eb 1d                	jmp    10b7 <cat+0x27>
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	53                   	push   %ebx
    10a4:	68 80 1b 00 00       	push   $0x1b80
    10a9:	6a 01                	push   $0x1
    10ab:	e8 5e 04 00 00       	call   150e <write>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	39 d8                	cmp    %ebx,%eax
    10b5:	75 26                	jne    10dd <cat+0x4d>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10b7:	83 ec 04             	sub    $0x4,%esp
    10ba:	68 00 02 00 00       	push   $0x200
    10bf:	68 80 1b 00 00       	push   $0x1b80
    10c4:	56                   	push   %esi
    10c5:	e8 3c 04 00 00       	call   1506 <read>
    10ca:	83 c4 10             	add    $0x10,%esp
    10cd:	83 f8 00             	cmp    $0x0,%eax
    10d0:	89 c3                	mov    %eax,%ebx
    10d2:	7f cc                	jg     10a0 <cat+0x10>
  if(n < 0){
    10d4:	75 1b                	jne    10f1 <cat+0x61>
}
    10d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d9:	5b                   	pop    %ebx
    10da:	5e                   	pop    %esi
    10db:	5d                   	pop    %ebp
    10dc:	c3                   	ret    
      printf(1, "cat: write error\n");
    10dd:	83 ec 08             	sub    $0x8,%esp
    10e0:	68 30 18 00 00       	push   $0x1830
    10e5:	6a 01                	push   $0x1
    10e7:	e8 54 05 00 00       	call   1640 <printf>
      exit();
    10ec:	e8 fd 03 00 00       	call   14ee <exit>
    printf(1, "cat: read error\n");
    10f1:	50                   	push   %eax
    10f2:	50                   	push   %eax
    10f3:	68 42 18 00 00       	push   $0x1842
    10f8:	6a 01                	push   $0x1
    10fa:	e8 41 05 00 00       	call   1640 <printf>
    exit();
    10ff:	e8 ea 03 00 00       	call   14ee <exit>
    1104:	66 90                	xchg   %ax,%ax
    1106:	66 90                	xchg   %ax,%ax
    1108:	66 90                	xchg   %ax,%ax
    110a:	66 90                	xchg   %ax,%ax
    110c:	66 90                	xchg   %ax,%ax
    110e:	66 90                	xchg   %ax,%ax

00001110 <strcpy>:
#include "user.h"
#include "x86.h"
#define PGSIZE          4096
char*
strcpy(char *s, const char *t)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	53                   	push   %ebx
    1114:	8b 45 08             	mov    0x8(%ebp),%eax
    1117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    111a:	89 c2                	mov    %eax,%edx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1120:	83 c1 01             	add    $0x1,%ecx
    1123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1127:	83 c2 01             	add    $0x1,%edx
    112a:	84 db                	test   %bl,%bl
    112c:	88 5a ff             	mov    %bl,-0x1(%edx)
    112f:	75 ef                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    1131:	5b                   	pop    %ebx
    1132:	5d                   	pop    %ebp
    1133:	c3                   	ret    
    1134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    113a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114a:	0f b6 02             	movzbl (%edx),%eax
    114d:	0f b6 19             	movzbl (%ecx),%ebx
    1150:	84 c0                	test   %al,%al
    1152:	75 1c                	jne    1170 <strcmp+0x30>
    1154:	eb 2a                	jmp    1180 <strcmp+0x40>
    1156:	8d 76 00             	lea    0x0(%esi),%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1160:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1163:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1166:	83 c1 01             	add    $0x1,%ecx
    1169:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    116c:	84 c0                	test   %al,%al
    116e:	74 10                	je     1180 <strcmp+0x40>
    1170:	38 d8                	cmp    %bl,%al
    1172:	74 ec                	je     1160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1174:	29 d8                	sub    %ebx,%eax
}
    1176:	5b                   	pop    %ebx
    1177:	5d                   	pop    %ebp
    1178:	c3                   	ret    
    1179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1182:	29 d8                	sub    %ebx,%eax
}
    1184:	5b                   	pop    %ebx
    1185:	5d                   	pop    %ebp
    1186:	c3                   	ret    
    1187:	89 f6                	mov    %esi,%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <strlen>:

uint
strlen(const char *s)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1196:	80 39 00             	cmpb   $0x0,(%ecx)
    1199:	74 15                	je     11b0 <strlen+0x20>
    119b:	31 d2                	xor    %edx,%edx
    119d:	8d 76 00             	lea    0x0(%esi),%esi
    11a0:	83 c2 01             	add    $0x1,%edx
    11a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11a7:	89 d0                	mov    %edx,%eax
    11a9:	75 f5                	jne    11a0 <strlen+0x10>
    ;
  return n;
}
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    11b0:	31 c0                	xor    %eax,%eax
}
    11b2:	5d                   	pop    %ebp
    11b3:	c3                   	ret    
    11b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000011c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	57                   	push   %edi
    11c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cd:	89 d7                	mov    %edx,%edi
    11cf:	fc                   	cld    
    11d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11d2:	89 d0                	mov    %edx,%eax
    11d4:	5f                   	pop    %edi
    11d5:	5d                   	pop    %ebp
    11d6:	c3                   	ret    
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <strchr>:

char*
strchr(const char *s, char c)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	8b 45 08             	mov    0x8(%ebp),%eax
    11e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    11ea:	0f b6 10             	movzbl (%eax),%edx
    11ed:	84 d2                	test   %dl,%dl
    11ef:	74 1d                	je     120e <strchr+0x2e>
    if(*s == c)
    11f1:	38 d3                	cmp    %dl,%bl
    11f3:	89 d9                	mov    %ebx,%ecx
    11f5:	75 0d                	jne    1204 <strchr+0x24>
    11f7:	eb 17                	jmp    1210 <strchr+0x30>
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	38 ca                	cmp    %cl,%dl
    1202:	74 0c                	je     1210 <strchr+0x30>
  for(; *s; s++)
    1204:	83 c0 01             	add    $0x1,%eax
    1207:	0f b6 10             	movzbl (%eax),%edx
    120a:	84 d2                	test   %dl,%dl
    120c:	75 f2                	jne    1200 <strchr+0x20>
      return (char*)s;
  return 0;
    120e:	31 c0                	xor    %eax,%eax
}
    1210:	5b                   	pop    %ebx
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret    
    1213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <gets>:

char*
gets(char *buf, int max)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	57                   	push   %edi
    1224:	56                   	push   %esi
    1225:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1226:	31 f6                	xor    %esi,%esi
    1228:	89 f3                	mov    %esi,%ebx
{
    122a:	83 ec 1c             	sub    $0x1c,%esp
    122d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1230:	eb 2f                	jmp    1261 <gets+0x41>
    1232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1238:	8d 45 e7             	lea    -0x19(%ebp),%eax
    123b:	83 ec 04             	sub    $0x4,%esp
    123e:	6a 01                	push   $0x1
    1240:	50                   	push   %eax
    1241:	6a 00                	push   $0x0
    1243:	e8 be 02 00 00       	call   1506 <read>
    if(cc < 1)
    1248:	83 c4 10             	add    $0x10,%esp
    124b:	85 c0                	test   %eax,%eax
    124d:	7e 1c                	jle    126b <gets+0x4b>
      break;
    buf[i++] = c;
    124f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1253:	83 c7 01             	add    $0x1,%edi
    1256:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1259:	3c 0a                	cmp    $0xa,%al
    125b:	74 23                	je     1280 <gets+0x60>
    125d:	3c 0d                	cmp    $0xd,%al
    125f:	74 1f                	je     1280 <gets+0x60>
  for(i=0; i+1 < max; ){
    1261:	83 c3 01             	add    $0x1,%ebx
    1264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1267:	89 fe                	mov    %edi,%esi
    1269:	7c cd                	jl     1238 <gets+0x18>
    126b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    126d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1270:	c6 03 00             	movb   $0x0,(%ebx)
}
    1273:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1276:	5b                   	pop    %ebx
    1277:	5e                   	pop    %esi
    1278:	5f                   	pop    %edi
    1279:	5d                   	pop    %ebp
    127a:	c3                   	ret    
    127b:	90                   	nop
    127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1280:	8b 75 08             	mov    0x8(%ebp),%esi
    1283:	8b 45 08             	mov    0x8(%ebp),%eax
    1286:	01 de                	add    %ebx,%esi
    1288:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    128a:	c6 03 00             	movb   $0x0,(%ebx)
}
    128d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1290:	5b                   	pop    %ebx
    1291:	5e                   	pop    %esi
    1292:	5f                   	pop    %edi
    1293:	5d                   	pop    %ebp
    1294:	c3                   	ret    
    1295:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012a0 <stat>:

int
stat(const char *n, struct stat *st)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12a5:	83 ec 08             	sub    $0x8,%esp
    12a8:	6a 00                	push   $0x0
    12aa:	ff 75 08             	pushl  0x8(%ebp)
    12ad:	e8 7c 02 00 00       	call   152e <open>
  if(fd < 0)
    12b2:	83 c4 10             	add    $0x10,%esp
    12b5:	85 c0                	test   %eax,%eax
    12b7:	78 27                	js     12e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    12b9:	83 ec 08             	sub    $0x8,%esp
    12bc:	ff 75 0c             	pushl  0xc(%ebp)
    12bf:	89 c3                	mov    %eax,%ebx
    12c1:	50                   	push   %eax
    12c2:	e8 7f 02 00 00       	call   1546 <fstat>
  close(fd);
    12c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12ca:	89 c6                	mov    %eax,%esi
  close(fd);
    12cc:	e8 45 02 00 00       	call   1516 <close>
  return r;
    12d1:	83 c4 10             	add    $0x10,%esp
}
    12d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12d7:	89 f0                	mov    %esi,%eax
    12d9:	5b                   	pop    %ebx
    12da:	5e                   	pop    %esi
    12db:	5d                   	pop    %ebp
    12dc:	c3                   	ret    
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    12e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12e5:	eb ed                	jmp    12d4 <stat+0x34>
    12e7:	89 f6                	mov    %esi,%esi
    12e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012f0 <atoi>:

int
atoi(const char *s)
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	53                   	push   %ebx
    12f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12f7:	0f be 11             	movsbl (%ecx),%edx
    12fa:	8d 42 d0             	lea    -0x30(%edx),%eax
    12fd:	3c 09                	cmp    $0x9,%al
  n = 0;
    12ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1304:	77 1f                	ja     1325 <atoi+0x35>
    1306:	8d 76 00             	lea    0x0(%esi),%esi
    1309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1310:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1313:	83 c1 01             	add    $0x1,%ecx
    1316:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    131a:	0f be 11             	movsbl (%ecx),%edx
    131d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1320:	80 fb 09             	cmp    $0x9,%bl
    1323:	76 eb                	jbe    1310 <atoi+0x20>
  return n;
}
    1325:	5b                   	pop    %ebx
    1326:	5d                   	pop    %ebp
    1327:	c3                   	ret    
    1328:	90                   	nop
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	56                   	push   %esi
    1334:	53                   	push   %ebx
    1335:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1338:	8b 45 08             	mov    0x8(%ebp),%eax
    133b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    133e:	85 db                	test   %ebx,%ebx
    1340:	7e 14                	jle    1356 <memmove+0x26>
    1342:	31 d2                	xor    %edx,%edx
    1344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    134c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    134f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1352:	39 d3                	cmp    %edx,%ebx
    1354:	75 f2                	jne    1348 <memmove+0x18>
  return vdst;
}
    1356:	5b                   	pop    %ebx
    1357:	5e                   	pop    %esi
    1358:	5d                   	pop    %ebp
    1359:	c3                   	ret    
    135a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001360 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1360:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1361:	a1 60 1b 00 00       	mov    0x1b60,%eax
{
    1366:	89 e5                	mov    %esp,%ebp
    1368:	57                   	push   %edi
    1369:	56                   	push   %esi
    136a:	53                   	push   %ebx
    136b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    136e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1378:	39 c8                	cmp    %ecx,%eax
    137a:	8b 10                	mov    (%eax),%edx
    137c:	73 32                	jae    13b0 <free+0x50>
    137e:	39 d1                	cmp    %edx,%ecx
    1380:	72 04                	jb     1386 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1382:	39 d0                	cmp    %edx,%eax
    1384:	72 32                	jb     13b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1386:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1389:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    138c:	39 fa                	cmp    %edi,%edx
    138e:	74 30                	je     13c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1390:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1393:	8b 50 04             	mov    0x4(%eax),%edx
    1396:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1399:	39 f1                	cmp    %esi,%ecx
    139b:	74 3a                	je     13d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    139d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    139f:	a3 60 1b 00 00       	mov    %eax,0x1b60
}
    13a4:	5b                   	pop    %ebx
    13a5:	5e                   	pop    %esi
    13a6:	5f                   	pop    %edi
    13a7:	5d                   	pop    %ebp
    13a8:	c3                   	ret    
    13a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13b0:	39 d0                	cmp    %edx,%eax
    13b2:	72 04                	jb     13b8 <free+0x58>
    13b4:	39 d1                	cmp    %edx,%ecx
    13b6:	72 ce                	jb     1386 <free+0x26>
{
    13b8:	89 d0                	mov    %edx,%eax
    13ba:	eb bc                	jmp    1378 <free+0x18>
    13bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    13c0:	03 72 04             	add    0x4(%edx),%esi
    13c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    13c6:	8b 10                	mov    (%eax),%edx
    13c8:	8b 12                	mov    (%edx),%edx
    13ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13cd:	8b 50 04             	mov    0x4(%eax),%edx
    13d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13d3:	39 f1                	cmp    %esi,%ecx
    13d5:	75 c6                	jne    139d <free+0x3d>
    p->s.size += bp->s.size;
    13d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    13da:	a3 60 1b 00 00       	mov    %eax,0x1b60
    p->s.size += bp->s.size;
    13df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    13e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    13e5:	89 10                	mov    %edx,(%eax)
}
    13e7:	5b                   	pop    %ebx
    13e8:	5e                   	pop    %esi
    13e9:	5f                   	pop    %edi
    13ea:	5d                   	pop    %ebp
    13eb:	c3                   	ret    
    13ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	57                   	push   %edi
    13f4:	56                   	push   %esi
    13f5:	53                   	push   %ebx
    13f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    13fc:	8b 15 60 1b 00 00    	mov    0x1b60,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1402:	8d 78 07             	lea    0x7(%eax),%edi
    1405:	c1 ef 03             	shr    $0x3,%edi
    1408:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    140b:	85 d2                	test   %edx,%edx
    140d:	0f 84 9d 00 00 00    	je     14b0 <malloc+0xc0>
    1413:	8b 02                	mov    (%edx),%eax
    1415:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1418:	39 cf                	cmp    %ecx,%edi
    141a:	76 6c                	jbe    1488 <malloc+0x98>
    141c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1422:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1427:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    142a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1431:	eb 0e                	jmp    1441 <malloc+0x51>
    1433:	90                   	nop
    1434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1438:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    143a:	8b 48 04             	mov    0x4(%eax),%ecx
    143d:	39 f9                	cmp    %edi,%ecx
    143f:	73 47                	jae    1488 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1441:	39 05 60 1b 00 00    	cmp    %eax,0x1b60
    1447:	89 c2                	mov    %eax,%edx
    1449:	75 ed                	jne    1438 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    144b:	83 ec 0c             	sub    $0xc,%esp
    144e:	56                   	push   %esi
    144f:	e8 22 01 00 00       	call   1576 <sbrk>
  if(p == (char*)-1)
    1454:	83 c4 10             	add    $0x10,%esp
    1457:	83 f8 ff             	cmp    $0xffffffff,%eax
    145a:	74 1c                	je     1478 <malloc+0x88>
  hp->s.size = nu;
    145c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    145f:	83 ec 0c             	sub    $0xc,%esp
    1462:	83 c0 08             	add    $0x8,%eax
    1465:	50                   	push   %eax
    1466:	e8 f5 fe ff ff       	call   1360 <free>
  return freep;
    146b:	8b 15 60 1b 00 00    	mov    0x1b60,%edx
      if((p = morecore(nunits)) == 0)
    1471:	83 c4 10             	add    $0x10,%esp
    1474:	85 d2                	test   %edx,%edx
    1476:	75 c0                	jne    1438 <malloc+0x48>
        return 0;
  }
}
    1478:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    147b:	31 c0                	xor    %eax,%eax
}
    147d:	5b                   	pop    %ebx
    147e:	5e                   	pop    %esi
    147f:	5f                   	pop    %edi
    1480:	5d                   	pop    %ebp
    1481:	c3                   	ret    
    1482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1488:	39 cf                	cmp    %ecx,%edi
    148a:	74 54                	je     14e0 <malloc+0xf0>
        p->s.size -= nunits;
    148c:	29 f9                	sub    %edi,%ecx
    148e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1491:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1494:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1497:	89 15 60 1b 00 00    	mov    %edx,0x1b60
}
    149d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    14a0:	83 c0 08             	add    $0x8,%eax
}
    14a3:	5b                   	pop    %ebx
    14a4:	5e                   	pop    %esi
    14a5:	5f                   	pop    %edi
    14a6:	5d                   	pop    %ebp
    14a7:	c3                   	ret    
    14a8:	90                   	nop
    14a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    14b0:	c7 05 60 1b 00 00 64 	movl   $0x1b64,0x1b60
    14b7:	1b 00 00 
    14ba:	c7 05 64 1b 00 00 64 	movl   $0x1b64,0x1b64
    14c1:	1b 00 00 
    base.s.size = 0;
    14c4:	b8 64 1b 00 00       	mov    $0x1b64,%eax
    14c9:	c7 05 68 1b 00 00 00 	movl   $0x0,0x1b68
    14d0:	00 00 00 
    14d3:	e9 44 ff ff ff       	jmp    141c <malloc+0x2c>
    14d8:	90                   	nop
    14d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    14e0:	8b 08                	mov    (%eax),%ecx
    14e2:	89 0a                	mov    %ecx,(%edx)
    14e4:	eb b1                	jmp    1497 <malloc+0xa7>

000014e6 <fork>:
    14e6:	b8 01 00 00 00       	mov    $0x1,%eax
    14eb:	cd 40                	int    $0x40
    14ed:	c3                   	ret    

000014ee <exit>:
    14ee:	b8 02 00 00 00       	mov    $0x2,%eax
    14f3:	cd 40                	int    $0x40
    14f5:	c3                   	ret    

000014f6 <wait>:
    14f6:	b8 03 00 00 00       	mov    $0x3,%eax
    14fb:	cd 40                	int    $0x40
    14fd:	c3                   	ret    

000014fe <pipe>:
    14fe:	b8 04 00 00 00       	mov    $0x4,%eax
    1503:	cd 40                	int    $0x40
    1505:	c3                   	ret    

00001506 <read>:
    1506:	b8 05 00 00 00       	mov    $0x5,%eax
    150b:	cd 40                	int    $0x40
    150d:	c3                   	ret    

0000150e <write>:
    150e:	b8 10 00 00 00       	mov    $0x10,%eax
    1513:	cd 40                	int    $0x40
    1515:	c3                   	ret    

00001516 <close>:
    1516:	b8 15 00 00 00       	mov    $0x15,%eax
    151b:	cd 40                	int    $0x40
    151d:	c3                   	ret    

0000151e <kill>:
    151e:	b8 06 00 00 00       	mov    $0x6,%eax
    1523:	cd 40                	int    $0x40
    1525:	c3                   	ret    

00001526 <exec>:
    1526:	b8 07 00 00 00       	mov    $0x7,%eax
    152b:	cd 40                	int    $0x40
    152d:	c3                   	ret    

0000152e <open>:
    152e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1533:	cd 40                	int    $0x40
    1535:	c3                   	ret    

00001536 <mknod>:
    1536:	b8 11 00 00 00       	mov    $0x11,%eax
    153b:	cd 40                	int    $0x40
    153d:	c3                   	ret    

0000153e <unlink>:
    153e:	b8 12 00 00 00       	mov    $0x12,%eax
    1543:	cd 40                	int    $0x40
    1545:	c3                   	ret    

00001546 <fstat>:
    1546:	b8 08 00 00 00       	mov    $0x8,%eax
    154b:	cd 40                	int    $0x40
    154d:	c3                   	ret    

0000154e <link>:
    154e:	b8 13 00 00 00       	mov    $0x13,%eax
    1553:	cd 40                	int    $0x40
    1555:	c3                   	ret    

00001556 <mkdir>:
    1556:	b8 14 00 00 00       	mov    $0x14,%eax
    155b:	cd 40                	int    $0x40
    155d:	c3                   	ret    

0000155e <chdir>:
    155e:	b8 09 00 00 00       	mov    $0x9,%eax
    1563:	cd 40                	int    $0x40
    1565:	c3                   	ret    

00001566 <dup>:
    1566:	b8 0a 00 00 00       	mov    $0xa,%eax
    156b:	cd 40                	int    $0x40
    156d:	c3                   	ret    

0000156e <getpid>:
    156e:	b8 0b 00 00 00       	mov    $0xb,%eax
    1573:	cd 40                	int    $0x40
    1575:	c3                   	ret    

00001576 <sbrk>:
    1576:	b8 0c 00 00 00       	mov    $0xc,%eax
    157b:	cd 40                	int    $0x40
    157d:	c3                   	ret    

0000157e <sleep>:
    157e:	b8 0d 00 00 00       	mov    $0xd,%eax
    1583:	cd 40                	int    $0x40
    1585:	c3                   	ret    

00001586 <uptime>:
    1586:	b8 0e 00 00 00       	mov    $0xe,%eax
    158b:	cd 40                	int    $0x40
    158d:	c3                   	ret    

0000158e <settickets>:
    158e:	b8 16 00 00 00       	mov    $0x16,%eax
    1593:	cd 40                	int    $0x40
    1595:	c3                   	ret    

00001596 <getpinfo>:
    1596:	b8 17 00 00 00       	mov    $0x17,%eax
    159b:	cd 40                	int    $0x40
    159d:	c3                   	ret    
    159e:	66 90                	xchg   %ax,%ax

000015a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
    15a3:	57                   	push   %edi
    15a4:	56                   	push   %esi
    15a5:	53                   	push   %ebx
    15a6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    15a9:	85 d2                	test   %edx,%edx
{
    15ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    15ae:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    15b0:	79 76                	jns    1628 <printint+0x88>
    15b2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    15b6:	74 70                	je     1628 <printint+0x88>
    x = -xx;
    15b8:	f7 d8                	neg    %eax
    neg = 1;
    15ba:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    15c1:	31 f6                	xor    %esi,%esi
    15c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    15c6:	eb 0a                	jmp    15d2 <printint+0x32>
    15c8:	90                   	nop
    15c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    15d0:	89 fe                	mov    %edi,%esi
    15d2:	31 d2                	xor    %edx,%edx
    15d4:	8d 7e 01             	lea    0x1(%esi),%edi
    15d7:	f7 f1                	div    %ecx
    15d9:	0f b6 92 70 18 00 00 	movzbl 0x1870(%edx),%edx
  }while((x /= base) != 0);
    15e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    15e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    15e5:	75 e9                	jne    15d0 <printint+0x30>
  if(neg)
    15e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    15ea:	85 c0                	test   %eax,%eax
    15ec:	74 08                	je     15f6 <printint+0x56>
    buf[i++] = '-';
    15ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    15f3:	8d 7e 02             	lea    0x2(%esi),%edi
    15f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    15fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    15fd:	8d 76 00             	lea    0x0(%esi),%esi
    1600:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1603:	83 ec 04             	sub    $0x4,%esp
    1606:	83 ee 01             	sub    $0x1,%esi
    1609:	6a 01                	push   $0x1
    160b:	53                   	push   %ebx
    160c:	57                   	push   %edi
    160d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1610:	e8 f9 fe ff ff       	call   150e <write>

  while(--i >= 0)
    1615:	83 c4 10             	add    $0x10,%esp
    1618:	39 de                	cmp    %ebx,%esi
    161a:	75 e4                	jne    1600 <printint+0x60>
    putc(fd, buf[i]);
}
    161c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    161f:	5b                   	pop    %ebx
    1620:	5e                   	pop    %esi
    1621:	5f                   	pop    %edi
    1622:	5d                   	pop    %ebp
    1623:	c3                   	ret    
    1624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1628:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    162f:	eb 90                	jmp    15c1 <printint+0x21>
    1631:	eb 0d                	jmp    1640 <printf>
    1633:	90                   	nop
    1634:	90                   	nop
    1635:	90                   	nop
    1636:	90                   	nop
    1637:	90                   	nop
    1638:	90                   	nop
    1639:	90                   	nop
    163a:	90                   	nop
    163b:	90                   	nop
    163c:	90                   	nop
    163d:	90                   	nop
    163e:	90                   	nop
    163f:	90                   	nop

00001640 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    1640:	55                   	push   %ebp
    1641:	89 e5                	mov    %esp,%ebp
    1643:	57                   	push   %edi
    1644:	56                   	push   %esi
    1645:	53                   	push   %ebx
    1646:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1649:	8b 75 0c             	mov    0xc(%ebp),%esi
    164c:	0f b6 1e             	movzbl (%esi),%ebx
    164f:	84 db                	test   %bl,%bl
    1651:	0f 84 bf 00 00 00    	je     1716 <printf+0xd6>
    1657:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    165a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    165d:	31 d2                	xor    %edx,%edx
    165f:	eb 39                	jmp    169a <printf+0x5a>
    1661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1668:	83 f8 25             	cmp    $0x25,%eax
    166b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    166e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1673:	74 1a                	je     168f <printf+0x4f>
  write(fd, &c, 1);
    1675:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1678:	83 ec 04             	sub    $0x4,%esp
    167b:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    167e:	6a 01                	push   $0x1
    1680:	50                   	push   %eax
    1681:	ff 75 08             	pushl  0x8(%ebp)
    1684:	e8 85 fe ff ff       	call   150e <write>
    1689:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    168c:	83 c4 10             	add    $0x10,%esp
    168f:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1692:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1696:	84 db                	test   %bl,%bl
    1698:	74 7c                	je     1716 <printf+0xd6>
    if(state == 0){
    169a:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    169c:	0f be cb             	movsbl %bl,%ecx
    169f:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    16a2:	74 c4                	je     1668 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    16a4:	83 fa 25             	cmp    $0x25,%edx
    16a7:	75 e6                	jne    168f <printf+0x4f>
      if(c == 'd'){
    16a9:	83 f8 64             	cmp    $0x64,%eax
    16ac:	0f 84 a6 00 00 00    	je     1758 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    16b2:	83 f8 6c             	cmp    $0x6c,%eax
    16b5:	0f 84 ad 00 00 00    	je     1768 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    16bb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    16c1:	83 f9 70             	cmp    $0x70,%ecx
    16c4:	74 5a                	je     1720 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16c6:	83 f8 73             	cmp    $0x73,%eax
    16c9:	0f 84 e1 00 00 00    	je     17b0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16cf:	83 f8 63             	cmp    $0x63,%eax
    16d2:	0f 84 28 01 00 00    	je     1800 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    16d8:	83 f8 25             	cmp    $0x25,%eax
    16db:	74 6b                	je     1748 <printf+0x108>
  write(fd, &c, 1);
    16dd:	8d 45 e7             	lea    -0x19(%ebp),%eax
    16e0:	83 ec 04             	sub    $0x4,%esp
    16e3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    16e7:	6a 01                	push   $0x1
    16e9:	50                   	push   %eax
    16ea:	ff 75 08             	pushl  0x8(%ebp)
    16ed:	e8 1c fe ff ff       	call   150e <write>
    16f2:	83 c4 0c             	add    $0xc,%esp
    16f5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    16f8:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    16fb:	6a 01                	push   $0x1
    16fd:	50                   	push   %eax
    16fe:	ff 75 08             	pushl  0x8(%ebp)
    1701:	83 c6 01             	add    $0x1,%esi
    1704:	e8 05 fe ff ff       	call   150e <write>
  for(i = 0; fmt[i]; i++){
    1709:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    170d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1710:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1712:	84 db                	test   %bl,%bl
    1714:	75 84                	jne    169a <printf+0x5a>
    }
  }
}
    1716:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1719:	5b                   	pop    %ebx
    171a:	5e                   	pop    %esi
    171b:	5f                   	pop    %edi
    171c:	5d                   	pop    %ebp
    171d:	c3                   	ret    
    171e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1720:	83 ec 0c             	sub    $0xc,%esp
    1723:	b9 10 00 00 00       	mov    $0x10,%ecx
    1728:	6a 00                	push   $0x0
    172a:	8b 17                	mov    (%edi),%edx
    172c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    172f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1732:	e8 69 fe ff ff       	call   15a0 <printint>
    1737:	83 c4 10             	add    $0x10,%esp
      state = 0;
    173a:	31 d2                	xor    %edx,%edx
    173c:	e9 4e ff ff ff       	jmp    168f <printf+0x4f>
    1741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1748:	83 ec 04             	sub    $0x4,%esp
    174b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    174e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1751:	6a 01                	push   $0x1
    1753:	eb a8                	jmp    16fd <printf+0xbd>
    1755:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1758:	83 ec 0c             	sub    $0xc,%esp
    175b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1760:	6a 01                	push   $0x1
    1762:	eb c6                	jmp    172a <printf+0xea>
    1764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    1768:	8b 57 04             	mov    0x4(%edi),%edx
    176b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    176d:	85 d2                	test   %edx,%edx
    176f:	74 15                	je     1786 <printf+0x146>
    1771:	83 ec 0c             	sub    $0xc,%esp
    1774:	8b 45 08             	mov    0x8(%ebp),%eax
    1777:	b9 10 00 00 00       	mov    $0x10,%ecx
    177c:	6a 00                	push   $0x0
    177e:	e8 1d fe ff ff       	call   15a0 <printint>
    1783:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    1786:	83 ec 0c             	sub    $0xc,%esp
    1789:	8b 45 08             	mov    0x8(%ebp),%eax
    178c:	89 da                	mov    %ebx,%edx
    178e:	6a 00                	push   $0x0
    1790:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    1795:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    1798:	e8 03 fe ff ff       	call   15a0 <printint>
    179d:	83 c4 10             	add    $0x10,%esp
      state = 0;
    17a0:	31 d2                	xor    %edx,%edx
    17a2:	e9 e8 fe ff ff       	jmp    168f <printf+0x4f>
    17a7:	89 f6                	mov    %esi,%esi
    17a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    17b0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    17b2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    17b5:	85 c9                	test   %ecx,%ecx
    17b7:	74 6a                	je     1823 <printf+0x1e3>
        while(*s != 0){
    17b9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    17bc:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    17be:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    17c0:	84 c0                	test   %al,%al
    17c2:	0f 84 c7 fe ff ff    	je     168f <printf+0x4f>
    17c8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    17cb:	89 de                	mov    %ebx,%esi
    17cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    17d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    17d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    17d6:	83 ec 04             	sub    $0x4,%esp
    17d9:	6a 01                	push   $0x1
          s++;
    17db:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    17de:	50                   	push   %eax
    17df:	53                   	push   %ebx
    17e0:	e8 29 fd ff ff       	call   150e <write>
        while(*s != 0){
    17e5:	0f b6 06             	movzbl (%esi),%eax
    17e8:	83 c4 10             	add    $0x10,%esp
    17eb:	84 c0                	test   %al,%al
    17ed:	75 e1                	jne    17d0 <printf+0x190>
    17ef:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    17f2:	31 d2                	xor    %edx,%edx
    17f4:	e9 96 fe ff ff       	jmp    168f <printf+0x4f>
    17f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1800:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    1802:	83 ec 04             	sub    $0x4,%esp
        ap++;
    1805:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    1808:	6a 01                	push   $0x1
        putc(fd, *ap);
    180a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    180d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1810:	50                   	push   %eax
    1811:	ff 75 08             	pushl  0x8(%ebp)
    1814:	e8 f5 fc ff ff       	call   150e <write>
    1819:	83 c4 10             	add    $0x10,%esp
      state = 0;
    181c:	31 d2                	xor    %edx,%edx
    181e:	e9 6c fe ff ff       	jmp    168f <printf+0x4f>
          s = "(null)";
    1823:	bb 68 18 00 00       	mov    $0x1868,%ebx
        while(*s != 0){
    1828:	b8 28 00 00 00       	mov    $0x28,%eax
    182d:	eb 99                	jmp    17c8 <printf+0x188>
