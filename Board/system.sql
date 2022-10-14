-- oracle http포트번호를 8080(기본) => 9090으로
EXEC dbms_xdb.sethttpport(9090);
commit;
-- 확인하기
SELECT dbms_xdb.gethttpport() FROM dual;

-- 유저 만들기
CREATE USER oracle IDENTIFIED BY 1234;
-- 권한을 줘야 작업 가능(접속 및 테이블생성등)
GRANT CONNECT, RESOURCE TO oracle;