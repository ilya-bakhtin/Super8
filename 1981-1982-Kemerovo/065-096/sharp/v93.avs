import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v93 = LSMASHVideoSource(dst_dir + "v93rc.mp4")

v93 = v93.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v93 = v93.convertToYV12(interlaced=false)

v93 = v93.UnsharpMask(strength=500, radius=5, threshold=1)
v93 = v93.adjustBorders

va = BlankClip(v93, audio_rate = 48000, channels = 2).killVideo
v93 = v93.audioDub(va)

return v93.Prefetch

