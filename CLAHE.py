import cv2
import os

root_dir = '../steel/test_images' # 디렉토리
 
img_path_list = []
possible_img_extension = ['.jpg', '.jpeg', '.JPG', '.bmp', '.png'] # 이미지 확장자들
 
for (root, dirs, files) in os.walk(root_dir):
    if len(files) > 0:
        for file_name in files:
            if os.path.splitext(file_name)[1] in possible_img_extension:
                img_path = root + '/' + file_name
                print(img_path)
                
                # 경로에서 \를 모두 /로 바꿔줘야함
                img_path_list.append(img_path)
                             
#print(img_path_list)

for i in img_path_list:

    # 이미지 읽기
    src = cv2.imread(i)
    src = cv2.cvtColor(src, cv2.COLOR_BGR2GRAY)
    aa = i[21:]
    print(aa)
    # CLAHE 객체 생성
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
    # CLAHE 객체에 원본 이미지 입력하여 CLAHE가 적용된 이미지 생성 
    gray_cont_dst = clahe.apply(src)
    cv2.imwrite("./test_images/%s"%aa, gray_cont_dst)
    #cv2.imshow('Increased contrast', gray_cont_dst)


