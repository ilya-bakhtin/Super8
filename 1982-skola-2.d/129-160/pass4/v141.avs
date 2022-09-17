LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v141 = LSMASHVideoSource(dst_dir + "v141rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v141f.mp4")
v141 = ImageSource(file = dst_dir + "v141-png\v141-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v141 = v141.convertToY.adjustSize

#v141 = v141.extractY.convertToYV12(interlaced=false)
#v141 = v141.deScratch.extractY

v141 = v141.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v141 = v141.convertBits(8).convertToYV12(interlaced=false)

v141 = v141.deScratch.extractY
v141 = v141.removeDirt
v141 = v141.convertToYV12(interlaced=false)
v141 = v141.UnsharpMask(strength=400, radius=5, threshold=1)
v141 = v141.adjustBorders
#v141 = v141.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v141 = v141.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v141, audio_rate = 48000, channels = 2).killVideo
v141 = v141.audioDub(va)

return v141.Prefetch

