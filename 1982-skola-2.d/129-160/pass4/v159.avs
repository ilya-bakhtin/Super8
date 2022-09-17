LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v159 = LSMASHVideoSource(dst_dir + "v159rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v159f.mp4")
v159 = ImageSource(file = dst_dir + "v159-png\v159-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v159 = v159.convertToY.adjustSize

#v159 = v159.extractY.convertToYV12(interlaced=false)
#v159 = v159.deScratch.extractY

v159 = v159.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v159 = v159.convertBits(8).convertToYV12(interlaced=false)

v159 = v159.deScratch.extractY
v159 = v159.removeDirt
v159 = v159.convertToYV12(interlaced=false)
v159 = v159.UnsharpMask(strength=400, radius=5, threshold=1)
v159 = v159.adjustBorders
#v159 = v159.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v159 = v159.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v159, audio_rate = 48000, channels = 2).killVideo
v159 = v159.audioDub(va)

return v159.Prefetch

