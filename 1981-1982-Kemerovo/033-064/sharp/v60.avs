import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v60 = LSMASHVideoSource(dst_dir + "v60rc.mp4")

v60 = v60.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v60 = v60.convertToYV12(interlaced=false)

v60 = v60.UnsharpMask(strength=500, radius=5, threshold=1)
v60 = v60.adjustBorders

va = BlankClip(v60, audio_rate = 48000, channels = 2).killVideo
v60 = v60.audioDub(va)

return v60.Prefetch

