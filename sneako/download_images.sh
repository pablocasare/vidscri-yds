#!/bin/bash
# Downloads all 59 images into a folder called "sneako-images", named by
# image number and timestamp (e.g. 001_0-00.png = the image for 0:00).
# Run it from a Terminal:  bash download_images.sh
cd "$(dirname "$0")"
mkdir -p sneako-images
fail=0
get() {
  [ -s "sneako-images/$1" ] && return
  if curl -fsSL -o "sneako-images/$1" "$2"; then echo "ok   $1"
  else rm -f "sneako-images/$1"; echo "FAIL $1"; fail=1; fi
}

get 001_0-00.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204203_0605d776-191e-4216-b7c2-6db906d2a472.png
get 002_0-05.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204203_eae76fa2-9e12-471d-bd28-815745339554.png
get 003_0-08.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204203_ad8098e4-dad1-4959-b78c-c1c83a83c4a5.png
get 004_0-14.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204307_a1d8086b-e7ff-4d40-9633-ce3fe0b711c8.png
get 005_0-19.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204204_7d5989bc-f0d7-47b3-abc0-0fa99e366d01.png
get 006_0-25.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204202_45cc7012-e1cb-49b6-970d-c928855abb2e.png
get 007_0-32.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204203_38af9c4c-37b4-44a9-ae3c-9d82e3a3c88c.png
get 008_0-40.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204203_cec6073b-c8c1-4c9d-9ded-a0b84b8b184a.png
get 009_0-41.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204307_8035db04-4cf5-4f32-b38d-8038403d1d55.png
get 010_0-47.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204307_3b711f22-d79f-49fb-bd3e-b3a85a76a95e.png
get 011_0-54.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204308_98de0c82-a43c-4285-8d51-76a23b39f61f.png
get 012_1-00.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204307_9a2e3fe8-4a9b-497d-a469-6406ee35194b.png
get 013_1-07.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204306_206f7cbe-3c3c-4021-acb5-bb3eca042461.png
get 014_1-10.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204308_9a52457f-80a1-4e29-8afc-3c813462845f.png
get 015_1-13.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204342_c9bce131-4f61-4fa9-8dcd-95ba055b7fdf.png
get 016_1-16.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204343_b056efde-ef85-4619-9c4b-8f8faf860980.png
get 017_1-24.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204432_c48bb4bb-fb1a-421a-8fd3-81306e0c74d4.png
get 018_1-27.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204432_15539451-a1c7-4b3a-a608-df69eaf029d9.png
get 019_1-36.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204432_700a56c4-2383-4fa5-bc91-a194fe8b9331.png
get 020_1-38.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204433_03b1b448-0e05-45ba-acd9-6a5c781aee89.png
get 021_1-45.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204433_f47bad08-cb7f-408a-baad-c110114bee28.png
get 022_1-55.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204526_260894d5-7a08-4776-b52c-5577227b8ba3.png
get 023_2-00.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204526_80269761-efc4-4e91-8e5f-14adaea0c926.png
get 024_2-04.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204528_34f6021b-21e7-4c5e-b91c-3f197e7f5518.png
get 025_2-06.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204526_bd1b84fa-b936-417b-a48b-50adf61c8ccb.png
get 026_2-11.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204527_b9a9afe2-ecbb-46f8-8568-73024267eeec.png
get 027_2-15.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204527_5d2d9459-173b-4b82-a2e3-8e51c2ae7916.png
get 028_2-18.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204626_56cb38da-fc55-4473-94e7-5bf58e196ba2.png
get 029_2-23.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204626_2ad0473c-523b-46d9-bc0e-ab0c4e46c223.png
get 030_2-27.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204719_c6f7ddf4-3b52-44da-90c3-0a6fd60c75e5.png
get 031_2-30.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204627_4e268aeb-b18e-4f22-9b1c-5032e4a1eaf9.png
get 032_2-38.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204625_58c9dbf1-0ea5-46db-98f7-315da927eaf7.png
get 033_2-42.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204718_d9e310c0-f66c-436c-acbd-81378cdd9dbe.png
get 034_2-48.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204625_48200344-dfc3-426a-9615-f224e50fbf6d.png
get 035_2-51.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204719_83bb6a9b-ce85-4c02-9a61-942601250583.png
get 036_2-59.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204719_ff11827b-7b82-4a42-bc96-b1f8048b3334.png
get 037_3-03.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204719_c24e5e39-be42-4de3-bc08-d759b263f088.png
get 038_3-07.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204805_2e5b13a4-2986-497a-ac9f-406325824384.png
get 039_3-13.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204805_3618e353-a42e-4ced-851e-f6b2ee60dcd6.png
get 040_3-16.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204805_1cbc6a83-38cd-4c2e-b6c8-ee99ba96f937.png
get 041_3-22.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204805_c9df191c-8c31-4dbb-b102-011b1b333c99.png
get 042_3-27.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204849_dd89cd76-023d-4794-accf-7763c226a097.png
get 043_3-30.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204851_8a008528-2c45-4e82-bb7e-3a3bf4db537f.png
get 044_3-37.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204851_58b5b960-4258-4270-a19e-6ca59c156e28.png
get 045_3-46.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204849_9f78d0dc-8848-4b5a-8ac5-7f02dec1e503.png
get 046_3-47.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204947_0870a431-19b6-4fef-9e6a-eaeecfd24a2c.png
get 047_3-52.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204947_f4c19691-e950-4d98-ac17-f4895bb8e50b.png
get 048_4-03.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204946_80f4b3c8-d799-4b6c-a223-8a5e473f7cbf.png
get 049_4-10.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204948_c8ed8662-2caf-44a7-804e-2358be4e592d.png
get 050_4-15.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204947_d698a9d2-1284-423e-8731-e1f576b5b4d0.png
get 051_4-18.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_204946_5f3f5b70-af08-4451-a5c9-ae49b5817f56.png
get 052_4-21.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_205029_ce957c3b-c16a-41fc-b3c4-6021dc11f2bb.png
get 053_4-24.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_205029_95793610-3ae9-4654-9e82-3256b7e824a2.png
get 054_4-27.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_205030_13b35071-2b8c-401c-a258-d545cbe01416.png
get 055_4-38.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_205122_837d732a-cfb2-47da-8cea-c7074f44c51c.png
get 056_4-41.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_205121_1a6e05b6-ed2c-4b8d-b29b-eca7c441601c.png
get 057_4-48.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_205120_36c32d95-ec6b-49f6-9fdf-892c985f1d1f.png
get 058_4-51.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_205121_5f336d04-251d-476e-aee5-ef77da57f92f.png
get 059_4-54.png https://d8j0ntlcm91z4.cloudfront.net/user_3JnhQwrBEKeiRB9kwtEe0sp8znc/hf_20261002_205122_0bb7a2fb-ce1d-45a5-ab5c-098c801cab8e.png

if [ $fail = 1 ]; then
  echo "Some images failed. Download those from your Higgsfield project 'How Sneako Made Enemies With Everyone'."
else
  echo "Done! All images are in the sneako-images folder."
fi
