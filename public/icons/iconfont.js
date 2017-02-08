;(function(window) {

  var svgSprite = '<svg>' +
    '' +
    '<symbol id="icon-shanchu" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M344.4593 791.382c15.4235 0 27.902-12.4795 27.902-27.902V456.558592c0-15.4225-12.4795-27.902-27.902-27.902-15.4225 0-27.902 12.4805-27.902 27.902v306.92249599999997C316.5573 778.9036 329.0368 791.382 344.4593 791.382zM511.872 791.382c15.4235 0 27.902-12.4795 27.902-27.902V456.558592c0-15.4225-12.4795-27.902-27.902-27.902s-27.902 12.4805-27.902 27.902v306.92249599999997C483.969 778.9036 496.4485 791.382 511.872 791.382zM679.2837 791.382c15.4235 0 27.902-12.4795 27.902-27.902V456.558592c0-15.4225-12.4795-27.902-27.902-27.902s-27.902 12.4805-27.902 27.902v306.92249599999997C651.3818 778.9036 663.8602 791.382 679.2837 791.382zM818.7935 149.6361H703.2340479999999c-12.4795-48.0113-55.8039-83.7059-107.6572-83.7059H428.16512000000006c-51.8533 0-95.1777 35.6946-107.6572 83.7059H204.949504c-61.5526 0-111.6078 50.0828-111.6078 111.6078v27.902976h27.901952v27.901952h55.803904v530.138112c0 61.526 50.0552 111.6078 111.6078 111.6078h446.432256c61.5547 0 111.6078-50.0818 111.6078-111.6078V317.047808h55.803904v-27.901952h27.901952v-27.902976C930.4013 199.7179 880.3482 149.6361 818.7935 149.6361zM428.1651 121.7341h167.411712c20.5445 0 38.3652 11.308 48.0389 27.902H380.12723200000005C389.801 133.0422 407.6206 121.7341 428.1651 121.7341zM790.8915 847.1859c0 30.7896-25.0399 55.8039-55.8039 55.8039H288.65536000000003c-30.763 0-59.6726-25.0143-59.6726-55.8039l3.8687-530.1381h558.040064V847.1859199999999zM149.1446 261.2439c0-30.7896 25.0419-55.8039 55.8039-55.8039H818.793472c30.7651 0 55.8039 25.0143 55.8039 55.8039H149.144576z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-user" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M638.8081 555.9101c77.3161-46.1599 129.4592-131.2492 129.4592-228.6469 0-146.3532-117.3975-265.4321-261.7129-265.4321-144.3144 0-261.7149 119.0789-261.7149 265.4321 0 99.1324 53.9494 185.5949 133.5624 231.1721-158.0411 51.5707-275.3853 191.999-291.1396 366.6842-1.7142 19.0474 12.33 35.884 31.3764 37.5962 19.0904 1.7592 35.8707-12.3279 37.5962-31.3754 16.7137-185.3942 169.7956-325.2091 356.0909-325.2091 186.2963 0 339.3772 139.8149 356.0909 325.2091 1.622 17.9866 16.725 31.5116 34.4412 31.5116 1.0465 0 2.0951-0.0451 3.156-0.1372 19.0464-1.7121 33.0885-18.5487 31.3754-37.5962C921.386 747.6613 800.6257 605.4318 638.8081 555.9101zM314.0833 327.2632c0-108.1702 86.3416-196.1902 192.471-196.1902 106.1315 0 192.468 88.02 192.468 196.1902 0 108.1713-86.3365 196.1892-192.468 196.1892C400.425 523.4524 314.0833 435.4345 314.0833 327.2632z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-re" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M527.258007 901.888871c180.447768 0 327.242066-145.125285 327.242066-323.483462 0-46.199205-16.32992-82.242096-35.217083-123.961266-19.357883-42.647309-40.697911-89.733721-48.837288-154.236803-67.357084 40.9916-65.117067 110.056582-62.164828 133.293819l16.824177 132.327818-86.97591-101.155864c-85.957721-100.006691-93.783966-214.021421-94.383624-354.605274C389.231397 200.697975 394.525983 377.733017 397.812843 487.704664c0.776689 26.079982 1.446955 48.647977-0.188288 66.36243l-6.847965 74.738192-58.279335-47.242977c-47.674812-38.639019-72.985268-102.440114-86.151126-152.161538-30.541597 40.596604-46.332235 99.019201-46.332235 149.001569C200.012871 756.765633 346.812285 901.888871 527.258007 901.888871M527.258007 941.960519c-202.867384 0-367.314737-162.785503-367.314737-363.55511 0-83.056648 37.748742-185.410803 113.031333-223.743854 0 0 13.46057 137.988748 84.749196 195.778942 8.498558-92.6307-57.431014-397.597437 226.041176-503.408321 0 170.395832-3.62762 288.682865 84.757382 391.521045-7.981788-62.97631 14.688537-162.128541 138.601708-197.064214-1.094938 162.517397 87.444585 217.581504 87.444585 336.919473C894.569674 779.172969 730.116181 941.960519 527.258007 941.960519L527.258007 941.960519 527.258007 941.960519z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-wenduji" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M510.807 646.079c-38.691 0-70.168 31.477-70.168 70.168s31.477 70.168 70.168 70.168c38.693 0 70.17-31.477 70.17-70.168S549.5 646.079 510.807 646.079z"  ></path>' +
    '' +
    '<path d="M700.036 442.259 750.4 442.259c15.935 0 28.854-12.922 28.854-28.856 0-15.934-12.919-28.854-28.854-28.854l-50.364 0 0-36.071 50.363 0.001c15.935 0 28.854-12.919 28.854-28.855s-12.919-28.856-28.854-28.856l-50.364 0 0-36.07 50.364 0c15.935 0 28.854-12.919 28.854-28.854 0-15.938-12.919-28.856-28.854-28.856l-50.364 0 0-4.361c0-43.016-21.853-84.226-59.948-113.061-34.649-26.232-79.985-40.679-127.652-40.679-47.662 0-92.995 14.447-127.648 40.676-38.097 28.833-59.945 70.041-59.945 113.063l0 334.313c-50.427 49.86-79.227 118.653-79.227 189.75 0 71.271 27.756 138.274 78.153 188.664 50.392 50.397 117.395 78.149 188.668 78.149 71.279 0 138.284-27.752 188.674-78.146 50.392-50.396 78.145-117.398 78.145-188.666 0-71.104-28.799-139.901-79.218-189.751L700.037 442.259zM512.436 839.643c-68.525 0-124.085-55.559-124.085-124.085 0-59.156 41.409-108.618 96.808-121.052L485.159 216.613c0-7.84 12.215-14.188 27.277-14.188 15.067 0 27.276 6.348 27.276 14.188l0 377.89c55.407 12.437 96.807 61.898 96.808 121.055C636.52 784.084 580.976 839.643 512.436 839.643z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-back" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M738.389333 109.155556 292.280889 516.693333l446.108444 407.537778c15.616 15.516444 15.616 40.704 0 56.234667-15.544889 15.559111-40.832 15.559111-56.376889 0L207.203556 546.844444c-8.291556-8.291556-11.847111-19.313778-11.306667-30.151111-0.540444-10.837333 3.015111-21.831111 11.306667-30.151111L682.012444 52.920889c15.544889-15.559111 40.832-15.559111 56.376889 0C754.005333 68.437333 754.005333 93.639111 738.389333 109.155556z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-fanhui" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M512.006 937.196c-234.84 0-425.204-190.362-425.204-425.19 0-234.83 190.364-425.206 425.204-425.206 234.83 0 425.192 190.376 425.192 425.206C937.198 746.836 746.836 937.196 512.006 937.196zM512.006 139.956c-205.476 0-372.048 166.572-372.048 372.05 0 205.476 166.572 372.048 372.048 372.048 205.478 0 372.04-166.572 372.04-372.048C884.044 306.528 717.484 139.956 512.006 139.956zM698.02 538.584 416.706 538.584l109.528 109.514c10.38 10.38 10.38 27.214 0 37.596-10.38 10.368-27.202 10.368-37.582 0l-150.328-150.342c-6.37-6.378-8.352-15.102-6.898-23.344-1.454-8.242 0.53-16.978 6.898-23.358l150.328-150.33c10.38-10.38 27.202-10.38 37.582 0s10.38 27.202 0 37.582l-109.528 109.528L698.02 485.43c14.682 0 26.576 11.894 26.576 26.578C724.596 526.678 712.702 538.584 698.02 538.584z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-xieya" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M663.22432 278.272c-74.632533-132.590933-149.03296-237.626027-149.275307-237.9776-3.785387-5.382827-10.052267-8.51968-16.67072-8.51968-6.62528 0.119467-12.837547 3.372373-16.561493 8.871253-0.23552 0.3584-71.3216 104.441173-142.650027 236.680533-71.08608 132.7104-143.353173 291.679573-143.94368 409.78432-0.29696 115.38432 46.127787 194.635093 107.63264 242.29888 61.508267 47.72864 136.144213 65.2288 195.52256 65.29024 59.66848-0.116053 137.20576-18.629973 201.90208-66.65216 64.703147-47.84128 115.08736-127.204693 114.793813-241.349973C813.32224 570.074453 737.7408 411.46368 663.22432 278.272zM519.72096 512.641707l0 414.129493-31.351467 0L488.369493 512.64512c-43.025067-7.441067-75.779413-44.858027-75.779413-90.0096 0-45.151573 32.754347-82.56512 75.779413-90.0096L488.369493 201.782613l31.351467 0L519.72096 332.629333c43.014827 7.451307 75.758933 44.86144 75.758933 90.006187C595.479893 467.780267 562.735787 505.1904 519.72096 512.641707z"  ></path>' +
    '' +
    '<path d="M504.04352 422.63552m-67.075413 0a19.651 19.651 0 1 0 134.150827 0 19.651 19.651 0 1 0-134.150827 0Z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-zhanghu1" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M509.881756 958.12364c-244.288772 0-442.325128-199.890586-442.325128-446.471564 0-246.578931 198.036355-446.471564 442.325128-446.471564s442.325128 199.892633 442.325128 446.471564C952.206884 758.233054 754.170528 958.12364 509.881756 958.12364zM538.704199 504.520655c58.680471-9.486048 103.364159-61.275575 103.364159-123.873262 0-69.302389-54.963823-125.477806-122.781394-125.477806-67.815525 0-122.781394 56.174394-122.781394 125.477806 0 62.445214 44.830021 114.38619 103.365182 123.873262-109.702518 9.431813-197.028399 112.86965-206.444862 225.616504l451.736475 0C735.809345 617.341187 648.450718 513.954515 538.704199 504.520655z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-icontizhong01" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M781.653 691.947c-64.853-47.787-95.573-44.373-88.747-129.707s20.48-153.6-20.48-211.627c-37.547-61.44-150.187-102.4-235.52-58.027-85.333 44.373-150.187 119.467-143.36 238.933 10.24 119.467 68.267 232.107 146.773 307.2s167.253 133.12 252.587 133.12c92.16 0 139.947-51.2 157.013-102.4 20.48-54.613 23.893-112.64-68.267-177.493z"  ></path>' +
    '' +
    '<path d="M638.293 261.867c40.96 0 75.093-40.96 75.093-95.573s-30.72-98.987-71.68-102.4c-40.96 0-75.093 40.96-75.093 95.573-3.413 54.613 30.72 102.4 71.68 102.4z"  ></path>' +
    '' +
    '<path d="M491.52 234.559c30.72-13.653 40.96-58.027 27.307-98.987-13.653-40.96-51.2-64.853-81.92-51.2-30.72 13.653-40.96 58.027-27.307 98.987 13.653 40.96 51.2 64.853 81.92 51.2z"  ></path>' +
    '' +
    '<path d="M361.813 299.413c20.48-17.067 23.893-51.2 6.827-81.92-20.48-30.72-51.2-40.96-75.093-27.307-20.48 17.067-23.893 51.2-3.413 81.92 17.067 30.72 47.787 40.96 71.68 27.307z"  ></path>' +
    '' +
    '<path d="M269.653 316.48c-20.48-17.067-47.787-17.067-61.44 0s-6.827 44.373 13.653 64.853c20.48 17.067 47.787 17.067 61.44 0 13.653-20.48 6.827-47.787-13.653-64.853z"  ></path>' +
    '' +
    '<path d="M221.867 429.119c-17.067-10.24-37.547-3.413-44.373 10.24-6.827 13.653 3.413 34.133 20.48 44.373s37.547 3.413 44.373-10.24c6.827-17.067 0-37.547-20.48-44.373z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-yanjing" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M512 209.403241c-201.731514 0-374.009206 125.476783-443.808922 302.596759 69.798692 177.119977 242.077408 302.596759 443.808922 302.596759 201.933105 0 374.010229-125.476783 443.808922-302.596759C886.009206 334.880023 713.933105 209.403241 512 209.403241zM512 713.731514c-111.355157 0-201.731514-90.375334-201.731514-201.731514s90.375334-201.731514 201.731514-201.731514 201.731514 90.375334 201.731514 201.731514S623.355157 713.731514 512 713.731514zM512 390.961296c-66.772776 0-121.038704 54.265928-121.038704 121.038704s54.265928 121.038704 121.038704 121.038704 121.038704-54.265928 121.038704-121.038704S578.772776 390.961296 512 390.961296z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-xietangzhi" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M844.822666 743.456512c-58.619072 41.193191-104.340393-150.565181-104.340393-150.565181-64.596204-239.718687-125.636419 8.974395-125.636419 8.974395-62.816674 300.595172-152.557558-8.974395-152.557558-8.974395-72.362075-159.731958-125.636419 44.86993-125.636419 44.86993-19.823488 0-35.896558 16.07307-35.896558 35.896558s16.07307 35.895535 35.896558 35.895535c19.822464 0 35.895535-16.072047 35.895535-35.895535 0-9.500375-3.759627-18.075681-9.7869-24.49488l9.7869-29.349445c39.23663-140.426263 89.740884 62.817698 89.740884 62.817698 116.189256 209.966059 179.479721-44.870953 179.479721-44.870953 27.142174-229.127468 80.767512-17.946744 80.767512-17.946744 31.066553 148.425448 82.510202 157.562549 108.887966 151.033855C769.683339 884.039341 649.795854 960.827215 512.003582 960.827215c-200.926172 0-363.807866-163.228595-363.807866-364.571253 0-201.349821 227.236398-394.033261 363.807866-532.833491 142.068669 142.375661 363.800703 331.48367 363.800703 532.833491C875.803261 648.654356 864.691179 698.422853 844.822666 743.456512z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-mima" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M777.106914 376.756783 246.893086 376.756783c-65.85487 0-119.423927 53.570079-119.423927 119.42495l0 343.325369c0 65.834404 53.570079 119.404484 119.423927 119.404484l530.21485 0c65.85487 0 119.42495-53.570079 119.42495-119.404484L896.532887 496.181733C896.531863 430.326862 842.961784 376.756783 777.106914 376.756783zM855.822696 839.507102c0 43.392276-35.303041 78.695317-78.714759 78.695317L246.893086 918.202419c-43.412742 0-78.714759-35.303041-78.714759-78.695317L168.178327 496.181733c0-43.412742 35.303041-78.714759 78.714759-78.714759l530.21485 0c43.412742 0 78.714759 35.303041 78.714759 78.714759L855.822696 839.507102z"  ></path>' +
    '' +
    '<path d="M353.476567 313.904293c11.250228 0 20.354584-9.104355 20.354584-20.354584L373.83115 244.849544c0-76.190263 61.978587-138.16885 138.16885-138.16885s138.16885 61.978587 138.16885 138.16885l0 52.496631c0 11.250228 9.104355 20.354584 20.354584 20.354584s20.354584-9.104355 20.354584-20.354584L690.878017 244.849544c0-98.632391-80.245625-178.878017-178.878017-178.878017S333.121983 146.217153 333.121983 244.849544l0 48.700165C333.121983 304.799938 342.225315 313.904293 353.476567 313.904293z"  ></path>' +
    '' +
    '<path d="M518.201236 611.92892c-56.372915 0-102.249779 45.877887-102.249779 102.249779 0 56.372915 45.877887 102.249779 102.249779 102.249779 56.372915 0 102.249779-45.877887 102.249779-102.249779C620.452038 657.805784 574.574151 611.92892 518.201236 611.92892zM518.201236 775.71931c-33.930787 0-61.540611-27.609825-61.540611-61.540611 0-33.930787 27.609825-61.540611 61.540611-61.540611 33.930787 0 61.540611 27.609825 61.540611 61.540611C579.74287 748.109486 552.133046 775.71931 518.201236 775.71931z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-ren" viewBox="0 0 1366 1024">' +
    '' +
    '<path d="M677.647059 0C394.541176 0 165.647059 228.894118 165.647059 512c0 283.105882 228.894118 512 512 512 283.105882 0 512-228.894118 512-512C1189.647059 228.894118 960.752941 0 677.647059 0zM528.564706 314.729412c7.529412-19.576471 19.576471-37.647059 34.635294-52.705882 15.058824-15.058824 33.129412-27.105882 51.2-34.635294 19.576471-7.529412 40.658824-12.047059 60.235294-12.047059 21.082353 0 42.164706 4.517647 60.235294 12.047059 19.576471 7.529412 37.647059 19.576471 51.2 34.635294 15.058824 15.058824 27.105882 33.129412 34.635294 52.705882 7.529412 19.576471 12.047059 40.658824 12.047059 61.741176 0 21.082353-4.517647 42.164706-12.047059 61.741176-7.529412 19.576471-19.576471 37.647059-34.635294 52.705882-15.058824 15.058824-33.129412 27.105882-51.2 34.635294-19.576471 7.529412-40.658824 12.047059-60.235294 12.047059-21.082353 0-42.164706-4.517647-60.235294-12.047059-19.576471-7.529412-37.647059-19.576471-51.2-34.635294-15.058824-15.058824-27.105882-33.129412-34.635294-52.705882-7.529412-19.576471-12.047059-40.658824-12.047059-61.741176C516.517647 353.882353 521.035294 332.8 528.564706 314.729412zM927.623529 772.517647c-6.023529 16.564706-18.070588 25.6-34.635294 34.635294-15.058824 9.035294-36.141176 12.047059-58.729412 12.047059 0 0 0 0 0 0l-316.235294 0c0 0 0 0 0 0-22.588235 0-42.164706-4.517647-58.729412-13.552941-16.564706-9.035294-28.611765-22.588235-34.635294-37.647059-6.023529-16.564706-6.023529-40.658824 0-58.729412 3.011765-7.529412 4.517647-16.564706 9.035294-24.094118 45.176471-87.341176 137.035294-147.576471 242.447059-147.576471 76.8 0 146.070588 30.117647 195.764706 81.317647 21.082353 22.588235 33.129412 39.152941 45.176471 63.247059 4.517647 7.529412 9.035294 15.058824 10.541176 24.094118 3.011765 9.035294 6.023529 22.588235 6.023529 34.635294C933.647059 752.941176 930.635294 763.482353 927.623529 772.517647z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-jiankang" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M731.787749 0.007163 330.083525 0.007163c-161.108201 0-292.183598 131.073351-292.183598 292.183598l0 99.579276c0 15.769038 12.782028 28.554136 28.554136 28.554136s28.554136-12.785098 28.554136-28.554136l0-99.579276c0-129.620266 105.455059-235.075325 235.075325-235.075325l401.704225 0c129.620266 0 235.075325 105.455059 235.075325 235.075325l0 401.707295c0 129.620266-105.455059 235.069186-235.075325 235.069186L330.083525 928.967241c-129.620266 0-235.075325-105.449943-235.075325-235.069186L95.008199 574.51692l116.123975 0c11.215357 0 21.39309-6.564463 26.016355-16.786197l26.016355-57.515546 107.346116 261.421182c4.411442 10.74157 14.862395 17.707167 26.407255 17.707167 0.329502 0 0.664121-0.005116 0.9926-0.016373 11.939853-0.41239 22.352944-8.215045 26.116638-19.547058l138.989592-419.023561 58.463121 206.880367c3.4741 12.296985 14.700714 20.79139 27.477626 20.79139l224.629489 0c15.772108 0 28.554136-12.782028 28.554136-28.554136s-12.782028-28.554136-28.554136-28.554136L670.563768 511.320018l-77.882267-275.606154c-3.412702-12.068789-14.299581-20.500773-26.836017-20.780134-12.364522-0.362248-23.796819 7.64916-27.74573 19.555245L394.073484 668.678851 290.8441 417.281906c-4.327532-10.54305-14.511404-17.50353-25.910955-17.701027-11.265499-0.404203-21.822875 6.396642-26.518795 16.781081l-45.703605 101.046687L28.575626 517.408647c-15.772108 0-28.554136 12.782028-28.554136 28.554136s12.782028 28.554136 28.554136 28.554136l9.324301 0 0 119.381136c0 161.108201 131.075397 292.177458 292.183598 292.177458l401.704225 0c161.113317 0 292.183598-131.070281 292.183598-292.177458L1023.971348 292.190761C1023.971348 131.080514 892.901067 0.007163 731.787749 0.007163z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-taoxin" viewBox="0 0 1078 1024">' +
    '' +
    '<path d="M463.494737 916.210526C183.242105 668.294737 0 501.221053 0 296.421053 0 129.347368 129.347368 0 296.421053 0 388.042105 0 479.663158 43.115789 538.947368 113.178947 598.231579 43.115789 689.852632 0 781.473684 0 948.547368 0 1077.894737 129.347368 1077.894737 296.421053 1077.894737 501.221053 894.652632 668.294737 614.4 916.210526L538.947368 991.663158 463.494737 916.210526Z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-zhanghu" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M934.4 1024c-12.8 0-25.6-12.8-25.6-25.6 0-108.8-38.4-204.8-115.2-281.6-12.8-12.8-12.8-25.6 0-38.4 12.8-12.8 25.6-12.8 38.4 0 83.2 83.2 134.4 198.4 134.4 320C960 1011.2 947.2 1024 934.4 1024L934.4 1024zM512 601.6 512 601.6c-108.8 0-204.8 44.8-281.6 115.2-76.8 76.8-115.2 172.8-115.2 281.6 0 12.8-12.8 25.6-25.6 25.6S64 1011.2 64 998.4c0-121.6 44.8-230.4 134.4-320C249.6 627.2 313.6 588.8 384 569.6 281.6 518.4 211.2 416 211.2 300.8 211.2 134.4 345.6 0 512 0s300.8 134.4 300.8 300.8S678.4 601.6 512 601.6L512 601.6zM512 51.2c-134.4 0-249.6 115.2-249.6 249.6s108.8 249.6 243.2 249.6c0 0 0 0 6.4 0l0 0c134.4 0 249.6-115.2 249.6-249.6C761.6 160 652.8 51.2 512 51.2L512 51.2z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-guanzhu" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M498.490312 236.264005l20.872377 20.210297 20.872377-20.210297c41.744753-39.928385 93.696985-59.132772 151.343917-59.132772 121.755018 0 216.805838 106.128109 216.805838 226.898707 0 17.746176-3.479241 35.984562-9.939373 55.209416 0 0-7.844665 21.589714-8.815783 26.447349-8.815783 44.079938 44.078914 35.263132 52.895721 8.815783s17.631566-65.826218 17.631566-90.472548c0-153.797805-113.526613-279.794427-268.577968-279.794427-64.108087 0-125.234259 21.196765-174.930101 60.631916-49.695842-39.435151-110.822015-60.631916-174.930101-60.631916-155.051355 0-280.781918 124.71442-280.781918 278.512225 0 196.190311 323.521325 423.930175 421.919379 488.50489 1.490957 0.985444 11.43033 5.4225 16.896832 5.4225 16.399505 0 28.426423 3.358491 37.242206-23.088858 0-26.447349-17.998933-30.333866-26.447349-35.263132C307.780829 714.901153 113.831558 521.045003 113.831558 402.74876c0-120.771621 107.457384-225.616504 229.213425-225.616504C400.691915 177.131233 456.745559 196.33562 498.490312 236.264005z"  ></path>' +
    '' +
    '<path d="M766.206656 635.558084 767.330246 469.098911 757.390873 459.240379 724.373898 459.240379 714.434525 469.098911 713.311958 635.558084 545.810037 635.558084 535.870664 645.416616 535.870664 678.594249 545.810037 688.452781 713.311958 688.452781 714.434525 854.911954 724.373898 864.770486 757.390873 864.770486 767.330246 854.911954 766.206656 688.452781 932.584987 687.410032 942.52436 677.5515 942.52436 644.373867 932.584987 634.514311Z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '</svg>'
  var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
  var shouldInjectCss = script.getAttribute("data-injectcss")

  /**
   * document ready
   */
  var ready = function(fn) {
    if (document.addEventListener) {
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
        setTimeout(fn, 0)
      } else {
        var loadFn = function() {
          document.removeEventListener("DOMContentLoaded", loadFn, false)
          fn()
        }
        document.addEventListener("DOMContentLoaded", loadFn, false)
      }
    } else if (document.attachEvent) {
      IEContentLoaded(window, fn)
    }

    function IEContentLoaded(w, fn) {
      var d = w.document,
        done = false,
        // only fire once
        init = function() {
          if (!done) {
            done = true
            fn()
          }
        }
        // polling for no errors
      var polling = function() {
        try {
          // throws errors until after ondocumentready
          d.documentElement.doScroll('left')
        } catch (e) {
          setTimeout(polling, 50)
          return
        }
        // no errors, fire

        init()
      };

      polling()
        // trying to always fire before onload
      d.onreadystatechange = function() {
        if (d.readyState == 'complete') {
          d.onreadystatechange = null
          init()
        }
      }
    }
  }

  /**
   * Insert el before target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var before = function(el, target) {
    target.parentNode.insertBefore(el, target)
  }

  /**
   * Prepend el to target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var prepend = function(el, target) {
    if (target.firstChild) {
      before(el, target.firstChild)
    } else {
      target.appendChild(el)
    }
  }

  function appendSvg() {
    var div, svg

    div = document.createElement('div')
    div.innerHTML = svgSprite
    svgSprite = null
    svg = div.getElementsByTagName('svg')[0]
    if (svg) {
      svg.setAttribute('aria-hidden', 'true')
      svg.style.position = 'absolute'
      svg.style.width = 0
      svg.style.height = 0
      svg.style.overflow = 'hidden'
      prepend(svg, document.body)
    }
  }

  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    window.__iconfont__svg__cssinject__ = true
    try {
      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    } catch (e) {
      console && console.log(e)
    }
  }

  ready(appendSvg)


})(window)