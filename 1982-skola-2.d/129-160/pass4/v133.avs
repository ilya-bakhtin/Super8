LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v133 = LSMASHVideoSource(dst_dir + "v133rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v133f.mp4")
v133 = ImageSource(file = dst_dir + "v133-png\v133-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v133 = v133.convertToY.adjustSize

#v133 = v133.extractY.convertToYV12(interlaced=false)
#v133 = v133.deScratch.extractY

v133 = v133.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v133 = v133.convertBits(8).convertToYV12(interlaced=false)

v133 = v133.deScratch.extractY
v133 = v133.removeDirt
v133 = v133.convertToYV12(interlaced=false)
v133 = v133.UnsharpMask(strength=400, radius=5, threshold=1)
v133 = v133.adjustBorders
#v133 = v133.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v133 = v133.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v133, audio_rate = 48000, channels = 2).killVideo
v133 = v133.audioDub(va)

return v133.Prefetch

