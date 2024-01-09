import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v48 = LSMASHVideoSource(dst_dir + "v48rc.mp4")

v48 = v48.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v48 = v48.convertToYV12(interlaced=false)

v48 = v48.UnsharpMask(strength=500, radius=5, threshold=1)
v48 = v48.adjustBorders

va = BlankClip(v48, audio_rate = 48000, channels = 2).killVideo
v48 = v48.audioDub(va)

return v48.Prefetch

