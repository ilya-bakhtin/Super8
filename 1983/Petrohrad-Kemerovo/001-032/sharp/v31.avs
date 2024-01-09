import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v31 = LSMASHVideoSource(dst_dir + "v31rc.mp4")

v31 = v31.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v31 = v31.convertToYV12(interlaced=false)

v31 = v31.UnsharpMask(strength=500, radius=5, threshold=1)
v31 = v31.adjustBorders

va = BlankClip(v31, audio_rate = 48000, channels = 2).killVideo
v31 = v31.audioDub(va)

return v31.Prefetch

