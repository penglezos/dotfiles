sudo apt-get install -y ccache bc bash git-core gnupg build-essential zip curl make automake autogen autoconf autotools-dev libtool shtool python m4 gcc libtool zlib1g-dev dash
git clone https://github.com/penglezos/aarch64-linux-android-4.9
git clone https://github.com/penglezos/android_kernel_xiaomi_msm8953.git -b pie

source /home/runner/run.sh
make ARCH=arm64 clean O=output
make ARCH=arm64 mrproper O=output
make O=output ARCH=arm64 mido_defconfig
make -j4 O=output ARCH=arm64 CROSS_COMPILE=/home/runner/mido/aarch64-linux-android-4.9/bin/aarch64-linux-android-
cd zip
cp ../output/arch/arm64/boot/Image.gz-dtb .
zip -r EnglezosKernel anykernel.sh META-INF/ ramdisk/ tools/ Image.gz-dtb
curl --upload-file ./EnglezosKernel.zip https://transfer.sh/EnglezosKernel.zip
source /home/runner/tg.sh