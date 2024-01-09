import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v59 = LSMASHVideoSource(dst_dir + "v59rc.mp4")

v59 = v59.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v59 = v59.convertToYV12(interlaced=false)

v59 = v59.UnsharpMask(strength=500, radius=5, threshold=1)
v59 = v59.adjustBorders

va = BlankClip(v59, audio_rate = 48000, channels = 2).killVideo
v59 = v59.audioDub(va)

return v59.Prefetch

