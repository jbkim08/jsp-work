-- oracle http��Ʈ��ȣ�� 8080(�⺻) => 9090����
EXEC dbms_xdb.sethttpport(9090);
commit;
-- Ȯ���ϱ�
SELECT dbms_xdb.gethttpport() FROM dual;

-- ���� �����
CREATE USER oracle IDENTIFIED BY 1234;
-- ������ ��� �۾� ����(���� �� ���̺������)
GRANT CONNECT, RESOURCE TO oracle;