import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v198 = LSMASHVideoSource(dst_dir + "v198rc.mp4")

v198 = v198.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v198 = v198.convertToYV12(interlaced=false)

v198 = v198.UnsharpMask(strength=500, radius=5, threshold=1)
v198 = v198.adjustBorders

va = BlankClip(v198, audio_rate = 48000, channels = 2).killVideo
v198 = v198.audioDub(va)

return v198.Prefetch

