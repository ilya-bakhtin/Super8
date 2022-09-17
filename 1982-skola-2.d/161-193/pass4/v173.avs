LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v173 = LSMASHVideoSource(dst_dir + "v173rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v173f.mp4")
v173 = ImageSource(file = dst_dir + "v173-png\v173-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v173 = v173.convertToY.adjustSize

#v173 = v173.extractY.convertToYV12(interlaced=false)
#v173 = v173.deScratch.extractY

v173 = v173.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v173 = v173.convertBits(8).convertToYV12(interlaced=false)

v173 = v173.deScratch.extractY
v173 = v173.removeDirt
v173 = v173.convertToYV12(interlaced=false)
v173 = v173.UnsharpMask(strength=400, radius=5, threshold=1)
v173 = v173.adjustBorders
#v173 = v173.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v173 = v173.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v173, audio_rate = 48000, channels = 2).killVideo
v173 = v173.audioDub(va)

return v173.Prefetch

