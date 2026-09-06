# تقرير بوابة الأمن

```
SECURITY GATE
- مشروع: EXISTING | NEW
- مكدس (مشاهَد):
- FABLE: Security
- تاريخ Git: موجود | غائب | لم يُفحص
- قاعدة حية: فُحصت | UNVERIFIED
```

G4 وG6: `file:line` للحارس وحده = `UNVERIFIED`. `PASS` فقط إذا مسار الرفض نُفّذ ووُجد مخرج أمر أو اختبار. إن لم يُشغّل: `not run`.

## قرارات البوابات

| بوابة | القرار | دليل (ملف:سطر ومسار رفض إن وُجد) |
|---|---|---|
| G1 إخفاء مفاتيح API | PASS / FAIL / UNVERIFIED | |
| G2 أسرار Git | PASS / FAIL / UNVERIFIED | |
| G3 مفتاح DB العام فقط | PASS / FAIL / UNVERIFIED | |
| G4 Row-Level Security | PASS / FAIL / UNVERIFIED | |
| G5 تشفير الحساس | PASS / FAIL / UNVERIFIED | |
| G6 مصادقة خادم | PASS / FAIL / UNVERIFIED | |
| G7 تأمين السجلات | PASS / FAIL / UNVERIFIED | |

## مصفوفة

| # | Severity | Location | Finding | Proposed action |
|---|----------|----------|---------|-----------------|
| 1 | | | | |

## أسرار مرصودة (بلا قيم)

| نوع | أين (HEAD / history / client / image) | الحالة |
|---|---|---|
| | | محروق ويحتاج rotate / اسم فقط في example |

## نطاق الإصلاح

- IN SCOPE:
- OUT OF SCOPE:
- MUST NOT CHANGE:
- IRREVERSIBLE (تحتاج موافقة بالاسم):

## Capability Blocks

- CAP-?: ما الذي تعذر / ماذا لزم / BLOCKED أو degrade

## بعد التنفيذ

| ما ادّعيته | الملف:السطر | كيف تحققت | مؤكد / غير مؤكد |
|---|---|---|---|
