#!/bin/bash
# Downloads all 124 images into a folder called "tickle-images", named by
# image number and timestamp (e.g. 001_0-00.png = the image for 0:00).
# Run it from a Terminal:  bash download_images.sh
cd "$(dirname "$0")"
mkdir -p tickle-images
fail=0

get() {
  local name=$1 url=$2
  [ -s "tickle-images/$name" ] && return
  if curl -fsSL -o "tickle-images/$name" "$url"; then
    echo "ok   $name"; return
  fi
  # The file name holds the second the image finished; try nearby seconds.
  local prefix=${url%_*_*} rest=${url#"$prefix"_} time=${rest%%_*} tail=${rest#*_}
  for d in -3 -2 -1 1 2 3; do
    local t=$(printf "%06d" $((10#$time + d)))
    if curl -fsSL -o "tickle-images/$name" "${prefix}_${t}_${tail}"; then
      echo "ok   $name"; return
    fi
  done
  rm -f "tickle-images/$name"; echo "FAIL $name"; fail=1
}

get 001_0-00.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022145_2b8a28cc-93ab-49ec-8a8b-dd0d140d8886.png
get 002_0-05.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022145_c8a04690-8ea8-4908-8335-1332a3d952ed.png
get 003_0-09.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022146_3e5c6bcb-d570-43eb-b6b3-fe5a0d3465b0.png
get 004_0-16.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022146_4cdb43c5-7471-4883-ad8e-123c5b9c40c7.png
get 005_0-18.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022146_2454f125-068f-479d-8aa9-ae2b231f889b.png
get 006_0-25.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022146_7807d64a-672a-48e9-afbd-a4379c70f4e6.png
get 007_0-29.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022146_0749059b-4bf6-4046-8c8c-14a66af1b22e.png
get 008_0-35.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022145_732a90d7-870e-4f03-9acd-c55250110c57.png
get 009_0-40.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022146_223fc0ea-8298-41df-b256-cabecb5e0335.png
get 010_0-48.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022146_bdaa01da-98aa-4f54-83cc-fc87fa340e21.png
get 011_0-53.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022305_c2eb506c-4092-4fd2-8b9a-1d982907a9d8.png
get 012_0-57.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022145_9d42688b-616c-49ae-8ab2-e532f0416820.png
get 013_1-07.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022305_88bb62c2-6b02-4288-8eff-fc6dd878fdc6.png
get 014_1-10.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022305_e7b8b0ea-bb22-4942-8c0c-3699fdfd0c38.png
get 015_1-17.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022305_f57f5180-b64f-45ae-9641-d677fdb2dfb0.png
get 016_1-24.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022305_395e1f57-5ded-4203-a03a-c9e00fe873ca.png
get 017_1-30.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022305_9896412f-ba1f-4099-9faf-9975360f1c06.png
get 018_1-39.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022305_a2a93726-e6fc-4e28-b295-806018fdb80f.png
get 019_1-49.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022305_0cc88ce8-2e12-4d62-9d30-621bc7d44c44.png
get 020_1-56.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022402_428997b3-9612-410d-aa0f-4bd3b4ab861e.png
get 021_2-00.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022404_9c4f1b0c-8106-48a9-a397-4c4c33666c1e.png
get 022_2-05.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022402_045894fb-5d48-408d-bb3c-ac0e11719a7d.png
get 023_2-09.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022402_885dfb08-1dc7-42e3-9997-2b29ad3b9fdb.png
get 024_2-14.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022403_70952554-7c03-480a-95f7-bb9b7b4d3884.png
get 025_2-16.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022403_c4c02352-4209-423b-b738-2604e8c53913.png
get 026_2-28.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022403_9e1ce287-3853-4ad1-b66f-611969fb01bd.png
get 027_2-31.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022402_29fdb0be-51ab-48a6-827d-d04b334f122c.png
get 028_2-39.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022503_f48e0d64-a53c-40d4-9ad4-e44edb47de18.png
get 029_2-47.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022503_e8a14487-e335-4df5-86c0-0626b4e06e50.png
get 030_2-59.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022504_c71617d4-5213-4f1d-a0a9-d9196ae5aa0e.png
get 031_3-03.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022503_d254e31d-6bff-4909-baf4-c24bcad73fa6.png
get 032_3-10.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022503_51e749f8-233e-4e15-920f-7589da30533b.png
get 033_3-14.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022503_c46cb4f1-8387-45fb-9a4a-88abec0d7a2b.png
get 034_3-20.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022503_3420e9ad-79cd-42b6-8ad9-632f1d84a22e.png
get 035_3-23.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022503_80547163-6fac-43db-ab19-a74303914557.png
get 036_3-31.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022609_f73f955a-d495-403d-905e-2fa538de9bd5.png
get 037_3-37.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022609_dd862c97-d8fe-4f96-a69a-dc9a8ac2bccc.png
get 038_3-46.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022609_d0e0bf5b-f38a-4019-ad1c-c12b9e5ec708.png
get 039_3-50.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022609_db2c500b-2296-4c9a-9562-b17d49b449aa.png
get 040_3-59.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022609_5d03717a-f784-4a9a-a331-b3114f603043.png
get 041_4-03.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022609_28873968-86dd-4a59-a95d-cdf7e50377df.png
get 042_4-10.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022609_99aee78f-289a-436b-a7ac-068af2c02d5f.png
get 043_4-18.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022609_0f792265-ba88-4252-8529-2f99a27377f7.png
get 044_4-25.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022715_88af6324-6aa5-463e-ba90-23e2b66606ff.png
get 045_4-32.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022715_ee7d6b30-05ac-4068-b076-bc716ed3e43a.png
get 046_4-42.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022715_40debe7e-77e6-4f8b-a899-cd8ebd016944.png
get 047_4-51.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022715_4206fad9-b84d-4b49-9911-f6ade8b9446e.png
get 048_4-57.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022715_09b3bb86-fc00-46d5-af1d-600d5685eeb1.png
get 049_5-00.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022715_a509a24c-bee7-42c1-af90-7e6c52934421.png
get 050_5-09.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022715_1338d44e-7711-4a7b-8c73-96f2f0387833.png
get 051_5-16.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022715_8530a8f9-466e-47a8-9b66-c234499bd269.png
get 052_5-22.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022809_7945a5fd-e444-4160-a508-38307f6e5f71.png
get 053_5-25.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022810_45fc2b0b-b62a-4649-a72d-62f2a9529b1f.png
get 054_5-30.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022809_4eb658b4-51ba-4b57-bd87-9f09fc83571c.png
get 055_5-36.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022809_b06f14c2-e525-44b5-9d0e-dc490ea3e6e1.png
get 056_5-42.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022809_7d571ba2-6ed8-4d85-8571-88cfa49346ea.png
get 057_5-46.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022809_f9d65b55-025b-440a-909a-1735aa97cd30.png
get 058_5-55.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022809_6294ed0e-c726-4b86-86a8-9d7720467e61.png
get 059_6-02.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022858_7b46c0ef-1280-46f4-9a62-ed44060825b3.png
get 060_6-06.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022858_2cafb46f-e5c3-4c00-99cc-a76fcaa9c03f.png
get 061_6-13.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022858_28a8c2ba-2c20-4428-a18a-4af4d8f38cba.png
get 062_6-18.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022858_5296cd1f-1d9b-4d55-b0fd-d3c3f9f6c533.png
get 063_6-29.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022858_ddd4ff4b-4f53-470c-8d60-25654ea720ae.png
get 064_6-33.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022858_89c46cdf-d9c9-4530-977a-6f1d8b432565.png
get 065_6-40.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022953_d4ebe24b-4c1f-4924-aab2-661b022ce53b.png
get 066_6-47.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022952_7b43544a-765d-4af1-965d-c4562a0ed1ea.png
get 067_6-55.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022952_e28c6d82-592d-4f09-a702-327be7605538.png
get 068_7-04.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022953_7337d85b-8a24-4c27-8557-86150a011529.png
get 069_7-12.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022952_82d3b6a5-7a7f-4638-8388-f8072030bc08.png
get 070_7-16.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022952_b8c9525c-ee25-40fd-9eb5-61de9394d278.png
get 071_7-22.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_022952_4b09f336-a147-43e0-963f-18481c2886c0.png
get 072_7-31.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023054_37043304-184c-43ee-bf92-98334fbdf6f8.png
get 073_7-36.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023054_b65a7850-f569-4d24-83f7-acc0b2ba9ea9.png
get 074_7-41.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023053_a925462c-5da6-49a4-92f8-db91b031ccc9.png
get 075_7-50.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023054_f0bf0381-f431-4d52-b608-4b9f1378bb38.png
get 076_7-54.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023054_9c7701c8-c3e8-4e85-aed7-ee54c1791865.png
get 077_8-02.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023054_0af7859b-48d1-4959-9d8d-5fd1a16f0dd6.png
get 078_8-08.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023054_06977dbe-98ef-4c8f-9295-d99aae9aee90.png
get 079_8-13.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023054_03b4baab-bae2-47af-9a1d-550979802f88.png
get 080_8-18.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023147_44538b1e-2cc0-458d-8eea-7cfb50a730ef.png
get 081_8-25.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023147_37a5a41a-cbc2-4014-831f-81ce289d067e.png
get 082_8-35.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023147_3dc4b2c2-a81c-4f32-87cc-46832fda40ae.png
get 083_8-41.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023147_8b7ccb86-91a3-4f00-8be2-6d543c421e71.png
get 084_8-47.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023147_63e3cba5-69c6-4b69-8c1d-2951862d0287.png
get 085_8-51.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023148_1209be52-6149-46fe-989a-61fcde6121bd.png
get 086_8-59.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023147_b6f1612e-222b-4158-9455-fe05a3f21f56.png
get 087_9-08.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023147_955a721e-6a3e-4cef-a0ed-41d536445785.png
get 088_9-11.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023244_cf932925-60b4-4243-a4ec-24427451b63f.png
get 089_9-18.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023244_70e50307-23f8-40a2-983b-f48ea11a475e.png
get 090_9-22.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023244_a6b98239-9552-495d-97ab-6f224c6424aa.png
get 091_9-29.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023244_c72bdce6-4ce1-4ecf-9d65-fea508d6a514.png
get 092_9-34.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023244_456a75f0-3b81-4bc1-8b50-1851d0a59095.png
get 093_9-38.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023324_3939385b-b0a4-4cdb-8630-81b77771cb29.png
get 094_9-49.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023244_79e4d2b2-9167-455d-871f-5af08f3bb41b.png
get 095_9-53.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023244_f97e494c-e496-4ea1-8086-32b771376c2a.png
get 096_9-57.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023324_8eea333c-b299-4bc4-a75c-63cbaed38c73.png
get 097_10-03.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023324_fe7aa627-1761-46ea-b0eb-c69e93469e84.png
get 098_10-10.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023405_c8b9d469-f72b-4e94-abea-82f1a7577c4c.png
get 099_10-17.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023405_c27c1348-8476-488b-a7e3-6d473f55f0d8.png
get 100_10-25.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023404_8aad635c-e208-47a4-afee-386104587170.png
get 101_10-29.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023405_8d0a66a1-a070-4813-8bc2-db9405944548.png
get 102_10-34.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023404_e2131006-6ebf-46f2-8e86-ff456c5c2492.png
get 103_10-38.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023443_7a59b5b9-f6aa-4eb4-8da1-af99ba6a7d57.png
get 104_10-42.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023443_de3e0b02-19b0-4445-9faa-c49481d76e5e.png
get 105_10-53.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023443_85c76333-c2cf-470d-a18d-b100e4f2c00e.png
get 106_10-59.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023443_c27fff89-fe55-4610-9f89-56b6354d4a5c.png
get 107_11-06.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023520_a7b6b5f8-25eb-4261-aac4-4ae6ce5f284c.png
get 108_11-10.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023520_0813f047-681d-4399-9a5f-340fc851fde4.png
get 109_11-17.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023520_a3802e32-e815-437d-98a6-41a968b5563a.png
get 110_11-22.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023520_86a569b4-a4c2-4a41-82ef-41fdacb827af.png
get 111_11-28.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023559_5e4e870e-024c-4e17-a16f-0895545c45a8.png
get 112_11-31.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023559_6d33a676-9a1e-49d3-8fbd-3216bb5ef458.png
get 113_11-35.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023559_f77eda76-2520-431a-a01d-ecaa17a4f324.png
get 114_11-42.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023559_943ad4d2-968b-4e92-8938-7232f5eabbea.png
get 115_11-51.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023636_06a7eeb6-573e-405c-953e-3899c9501f99.png
get 116_11-54.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023636_2ffafc10-7dce-4e41-b09e-bdbdd7638d58.png
get 117_11-58.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023636_1a5d7613-0f69-4965-ba38-fb331c6740f4.png
get 118_12-01.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023636_fd506fab-0ecd-457e-bf5f-b118d1dbca22.png
get 119_12-07.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023719_834e642e-254a-41fe-a2c2-c2821539ac81.png
get 120_12-15.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023719_e50b68a0-5fce-4ed6-b35d-40f44462198e.png
get 121_12-20.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023720_a3f3fd8b-4551-4e67-9856-22b0c11471ce.png
get 122_12-24.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023719_fbb0616e-4cb4-460b-944d-5b25aeb15932.png
get 123_12-29.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023719_5774c512-157e-4a2f-af2b-ea1998add974.png
get 124_12-31.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20260930_023719_41ef33c5-5153-4abe-8bac-7c60363bdb6c.png

if [ $fail = 1 ]; then
  echo "Some images failed. Open your Higgsfield project 'Why You Can't Tickle Yourself' to download those."
else
  echo "Done! All images are in the tickle-images folder."
fi
