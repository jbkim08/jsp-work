-- oracle http포트번호를 8080(기본) => 9090으로
EXEC dbms_xdb.sethttpport(9090);
commit;
-- 확인하기
SELECT dbms_xdb.gethttpport() FROM dual;
