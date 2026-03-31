import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v326 = LSMASHVideoSource(dst_dir + "v326rc.mp4")

v326 = v326.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v326 = v326.convertToYV12(interlaced=false)

v326 = v326.UnsharpMask(strength=500, radius=5, threshold=1)
v326 = v326.adjustBorders

va = BlankClip(v326, audio_rate = 48000, channels = 2).killVideo
v326 = v326.audioDub(va)

return v326.Prefetch

