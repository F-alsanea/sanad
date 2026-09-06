# مهايئات المكدس — أين تبحث

اقرأ كتلة الإطار المشاهَد فقط.

## Next.js (App Router)
- أسرار خادم: بلا بادئة `NEXT_PUBLIC_`، تُقرأ في `route.ts` / server actions / `server-only`
- أسرار في `NEXT_PUBLIC_*` = عميل = Critical إن كانت واسعة
- الحارس: `middleware.ts` + إعادة الفحص داخل كل handler
- لا تستورد Prisma/عميل DB في ملف عليه `"use client"`

## Supabase
- `anon` في العميل مسموح بشرط RLS إلزامي على كل جدول حساس
- `service_role` في أي ملف عميل أو `NEXT_PUBLIC_SUPABASE_SERVICE_ROLE` = Critical
- افحص `supabase/migrations/*` لـ `ENABLE ROW LEVEL SECURITY` و `CREATE POLICY`
- `auth.uid()` في السياسة؛ لا تعتمد على `user_id` من الـ body

## Firebase
- قواعد Firestore/Storage هي العزل. `allow read, write: if true` = Critical
- Admin SDK على الخادم فقط

## Express / Fastify / Nest
- أسرار من `process.env`
- cookie `httpOnly`+`secure`+`sameSite`
- كل مسار بيانات يتحقق الجلسة قبل الاستعلام

## Prisma / Drizzle / TypeORM
- `DATABASE_URL` خادمي فقط
- لا استعلام بـ id دون قيد المالك بعد الجلسة

## موبايل
- أي مفتاح في التطبيق يُستخرج. اعتبره عاماً
- لا تضع service role في التطبيق

## Docker / CI
- `ENV KEY=value` في Dockerfile أو workflow = High/Critical
- أسرار CI في secrets store لا في اللوج
