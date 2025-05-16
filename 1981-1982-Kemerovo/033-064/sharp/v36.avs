import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v36 = LSMASHVideoSource(dst_dir + "v36rc.mp4")

v36 = v36.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v36 = v36.convertToYV12(interlaced=false)

v36 = v36.UnsharpMask(strength=500, radius=5, threshold=1)
v36 = v36.adjustBorders

va = BlankClip(v36, audio_rate = 48000, channels = 2).killVideo
v36 = v36.audioDub(va)

return v36.Prefetch

