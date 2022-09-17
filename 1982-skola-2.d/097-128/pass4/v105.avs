LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v105 = LSMASHVideoSource(dst_dir + "v105rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v105f.mp4")
v105 = ImageSource(file = dst_dir + "v105-png\v105-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v105 = v105.convertToY.adjustSize

#v105 = v105.extractY.convertToYV12(interlaced=false)
#v105 = v105.deScratch.extractY

v105 = v105.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v105 = v105.convertBits(8).convertToYV12(interlaced=false)

v105 = v105.deScratch.extractY
v105 = v105.removeDirt
v105 = v105.convertToYV12(interlaced=false)
v105 = v105.UnsharpMask(strength=400, radius=5, threshold=1)
v105 = v105.adjustBorders
#v105 = v105.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v105 = v105.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v105, audio_rate = 48000, channels = 2).killVideo
v105 = v105.audioDub(va)

return v105.Prefetch

