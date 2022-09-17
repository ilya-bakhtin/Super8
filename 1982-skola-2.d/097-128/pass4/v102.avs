LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v102 = LSMASHVideoSource(dst_dir + "v102rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v102f.mp4")
v102 = ImageSource(file = dst_dir + "v102-png\v102-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v102 = v102.convertToY.adjustSize

#v102 = v102.extractY.convertToYV12(interlaced=false)
#v102 = v102.deScratch.extractY

v102 = v102.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v102 = v102.convertBits(8).convertToYV12(interlaced=false)

v102 = v102.deScratch.extractY
v102 = v102.removeDirt
v102 = v102.convertToYV12(interlaced=false)
v102 = v102.UnsharpMask(strength=400, radius=5, threshold=1)
v102 = v102.adjustBorders
#v102 = v102.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v102 = v102.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v102, audio_rate = 48000, channels = 2).killVideo
v102 = v102.audioDub(va)

return v102.Prefetch

