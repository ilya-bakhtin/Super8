import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v35 = LSMASHVideoSource(dst_dir + "v35rc.mp4")

v35 = v35.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v35 = v35.convertToYV12(interlaced=false)

v35 = v35.UnsharpMask(strength=500, radius=5, threshold=1)
v35 = v35.adjustBorders

va = BlankClip(v35, audio_rate = 48000, channels = 2).killVideo
v35 = v35.audioDub(va)

return v35.Prefetch

