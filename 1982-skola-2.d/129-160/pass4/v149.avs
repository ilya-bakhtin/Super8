LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v149 = LSMASHVideoSource(dst_dir + "v149rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v149f.mp4")
v149 = ImageSource(file = dst_dir + "v149-png\v149-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v149 = v149.convertToY.adjustSize

#v149 = v149.extractY.convertToYV12(interlaced=false)
#v149 = v149.deScratch.extractY

v149 = v149.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v149 = v149.convertBits(8).convertToYV12(interlaced=false)

v149 = v149.deScratch.extractY
v149 = v149.removeDirt
v149 = v149.convertToYV12(interlaced=false)
v149 = v149.UnsharpMask(strength=400, radius=5, threshold=1)
v149 = v149.adjustBorders
#v149 = v149.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v149 = v149.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v149, audio_rate = 48000, channels = 2).killVideo
v149 = v149.audioDub(va)

return v149.Prefetch

