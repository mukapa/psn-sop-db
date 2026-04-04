select c.seq, a.seq, a.org_name, 
a.participant AS "참여자",a.liaison AS "연락관",
c.call_time || '\n' || c.call_method || '\n' || REPLACE(c.situation_contact, ' ', '\n') "일일교신",
    CASE 
      WHEN a.file_title = '제2권 재난안전대책본부 편(2025년 하반기).docx' THEN '재난안전대책본부'
      WHEN a.file_title = '제3권 재난안전상황실 편(2025년 하반기).docx' THEN '재난안황상황실'
      WHEN a.file_title = '제4권 소방 긴급구조통제단 편(2025년 하반기).docx' THEN '소방 긴급구조통제단'
      WHEN a.file_title = '제5권 해경 구조본부 편(2025년 하반기).docx' THEN '해경 구조본부'
      ELSE 'N/A'
    END AS "주관기관",
a.common_group_name AS "공통통화그룹명", 
d.main_org AS "주관기관(주관자)",
d.main_contact AS "연락관(메타)",
a.file_title 
from participant_info a, regular_call c, group_meta d
where 1=1
and a.file_title = c.file_title and a.common_group_name = c.common_group_name
and a.file_title = d.file_title AND a.common_group_name = d.common_group_name
order by substr(a.file_title,2,1), lpad(c.seq::text,5,'0'),  lpad(a.seq::text,3,'0')
;