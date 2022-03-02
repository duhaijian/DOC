sudo -E apt-get -qq update
sudo -E apt-get -qq autoremove --purge
sudo -E apt-get -qq clean
sudo timedatectl set-timezone "Asia/Shanghai"

#df -hT $PWD
#git clone https://github.com/home-assistant/operating-system.git -b dev HassOS
#./scripts/enter.sh make -j$(($(nproc) + 1)) generic_x86_64

cd /home/du/bianyi/HassOS
sed -i 's/lists\/\*/lists\/*\ \&\& apt-get clean/g' Dockerfile
sed -i 's/-e\ BUILDER_UID/-e TZ=Asia\/Shanghai\ -e BUILDER_UID/g' buildroot-external/package/hassio/hassio.mk 
sed -i 's/-e\ BUILDER_UID/-e TZ=Asia\/Shanghai\ -e BUILDER_UID/g' scripts/enter.sh
sed -i 's/-e\ SUPERVISOR_NAME=hassio_supervisor/-e TZ=Asia\/Shanghai\ -e SUPERVISOR_NAME=hassio_supervisor/g' buildroot-external/rootfs-overlay/usr/sbin/hassos-supervisor
sed -i '/vhdx/d' buildroot-external/scripts/hdd-image.sh
sed -i '/vdi/d' buildroot-external/scripts/hdd-image.sh
sed -i '/vhdx/d' buildroot-external/board/pc/generic_x86_64/hassos-hook.sh
sed -i '/vdi/d' buildroot-external/board/pc/generic_x86_64/hassos-hook.sh
sed -i 's/homeassistant/itcommander/g' buildroot-external/configs/generic_x86_64_defconfig
sed -i 's/Welcome to Home Assistant/Welcome to Home Assistant (IT Commander YouTuBe Channle)/g' buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_TARGET_GENERIC_ROOT_PASSWD=\"\"" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_ROOTFS_SKELETON_DEFAULT=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_TARGET_ENABLE_ROOT_LOGIN=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_HOST_LZO=n" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_VIM=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_VIM_RUNTIME=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_NANO=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_NANO_TINY=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_NTP=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_NTP_SNTP=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_NTPDATE=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_NTPTIME=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_TZDATA=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_HTOP=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_WGET=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_TARGET_INFO=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_PACKAGE_HOST_ZIP=y" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_TARGET_ZONELIST=\"default\"" >> buildroot-external/configs/generic_x86_64_defconfig
echo "BR2_TARGET_LOCALTIME=\"Asia/Shanghai\"" >> buildroot-external/configs/generic_x86_64_defconfig

