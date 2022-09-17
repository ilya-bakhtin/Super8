LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v53 = LSMASHVideoSource(dst_dir + "v53rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v53f.mp4")
v53 = ImageSource(file = dst_dir + "v53-png\v53-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v53 = v53.convertToY.adjustSize

#v53 = v53.extractY.convertToYV12(interlaced=false)
#v53 = v53.deScratch.extractY

v53 = v53.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v53 = v53.convertBits(8).convertToYV12(interlaced=false)

v53 = v53.deScratch.extractY
v53 = v53.removeDirt
v53 = v53.convertToYV12(interlaced=false)
v53 = v53.UnsharpMask(strength=400, radius=5, threshold=1)
v53 = v53.adjustBorders
#v53 = v53.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v53 = v53.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v53, audio_rate = 48000, channels = 2).killVideo
v53 = v53.audioDub(va)

return v53.Prefetch

