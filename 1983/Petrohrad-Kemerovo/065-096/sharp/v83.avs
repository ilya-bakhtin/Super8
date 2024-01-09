import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v83 = LSMASHVideoSource(dst_dir + "v83rc.mp4")

v83 = v83.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v83 = v83.convertToYV12(interlaced=false)

v83 = v83.UnsharpMask(strength=500, radius=5, threshold=1)
v83 = v83.adjustBorders

va = BlankClip(v83, audio_rate = 48000, channels = 2).killVideo
v83 = v83.audioDub(va)

return v83.Prefetch

