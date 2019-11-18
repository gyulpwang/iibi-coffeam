SELECT count(idx) cnt FROM memo;

-- select rownum, memo.* from memo order by idx desc;

select * from(
  select rownum rn, a.* from(
  (select * from memo order by idx desc) a)
)
where rn between 1 and 10;

/*
------------------------------------------
cpage     pageSize     start     end
------------------------------------------
  1          10          1       10
  2          10          11      20
  3          10          21      30
  ...
  end = cpage * pageSize
  start = end - (pageSize-1)
*/

-- ��ǰ ���� �Խ��� ��� ����¡ ó��
select * from(
select rownum rn, A.* from 
(select * from prod_review where pnum = 1 order by num desc) A
)where rn between 1 and 3;

/*
cpage   pageSize    start   end
1       3           1       3
2       3           4       6     
end = cpage*pageSize;
start = end-(pageSize-1)
*/

-- row_number() over(order by��) �м��Լ��� �̿��� ó���غ���.
-- rownum���� ������ ����.
select * from(
select row_number() over(order by num desc) rn, prod_review.*
from prod_review where pnum=1
) where rn between 1 and 3;

-- rank() over(order by��) : ���� ���� 3�� �ȿ� �մ� ��ǰ ��������
select * from(
select rank() over(order by score desc) rk, prod_review.*
from prod_review
) where rk < 4;

delete prod_review where num=1;
rollback;